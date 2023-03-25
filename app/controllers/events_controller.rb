class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  
  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(tweet_params)
    @event.host = current_user

    respond_to do |format|
      if @event.save
        format.turbo_stream
      else
        format.html do
          flash[:event_errors] = @event.errors.full_messages
          redirect_to root_path
        end
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
