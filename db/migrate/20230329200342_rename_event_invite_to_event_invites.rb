class RenameEventInviteToEventInvites < ActiveRecord::Migration[7.0]
  def change
    rename_table :event_invite, :event_invites
  end
end
