class RenameInvitedGuestsToEventInvite < ActiveRecord::Migration[7.0]
  def change
    rename_table :invited_guests, :event_invite
  end
end
