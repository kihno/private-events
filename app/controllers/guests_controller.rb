class GuestsController < ApplicationController
  before_action :get_users, :get_event

  def index
    @guests = @event.guests
  end

  private

  def get_users
    @users = User.all.order(name: :asc)
  end

  def get_event
    @event = Event.find(params[:event_id])
  end
end
