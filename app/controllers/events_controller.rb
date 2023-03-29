class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all.order(date: :asc)
  end

  
  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    current_user.hosted_events << @event

    respond_to do |format|
      if @event.save
        format.turbo_stream
        format.html { redirect_to @event, notice: "Event was successfully created." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@event)}_form", partial: "form", locals: { event: @event }) }
        format.html { render :new, status: :unprocessabile_entity }
      end
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @article.update(article_params)
      format.html { redirect_to @event, notice: "Event was successfully updated." }
    else
      format.turbo_stream { render turbo_stream: turbo_stream.replace(helpers.dom_id(@event), partial: "form", locals: { event: @event }) }
      format.html { render :new, status: :unprocessabile_entity }
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully deleted." }
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date)
  end
end
