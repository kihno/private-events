class EventsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = Event.all
  end

  
  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    current_user.hosted_events << @event

    respond_to do |format|
      if @event.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_event", partial: "event_link") }
        format.html { redirect_to @event, notice: "Event was successfully created." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@event)}_form", partial: "form", locals: { event: @event }) }
        format.html { render :new, status: :unprocessabile_entity }
        # format.html do
        #   flash[:event_errors] = @event.errors.full_messages
        #   redirect_to root_path
        # end
      end
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date)
  end
end
