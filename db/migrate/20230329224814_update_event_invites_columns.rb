class UpdateEventInvitesColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :event_invites, :invited_event, :invited_event_id
    rename_column :event_invites, :event_guest, :event_guest_id
  end
end
