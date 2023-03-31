class EventInvitesController < ApplicationController
  def create
    @event = Event.find(params[:event_invite][:invited_event_id])

    if @event.guests.include?(params[:event_invite][:event_guest_id])
      redirect_to @event, notice: "You are already attending this event."
    else
      @event_invite = EventInvite.new(event_invite_params)

      if @event_invite.save
        redirect_to event_path(@event_invite.invited_event_id), notice: "You are now attending this event."
      else
        redirect_to event_path(@event_invite.invited_event_id), notice: "Oops, something whent wrong."
      end
    end
  end

  def destroy
    @event_invite = EventInvite.where(invited_event_id: params[:event_invite][:invited_event_id], event_guest_id: params[:event_invite][:event_guest_id]).first
    @event_invite.destroy

    respond_to do |format|
      format.html { redirect_to event_path(@event_invite.invited_event_id), notice: "You have been removed from the guest list." }
    end
  end

  private

  def event_invite_params
    params.require(:event_invite).permit(:invited_event_id, :event_guest_id)
  end
end
