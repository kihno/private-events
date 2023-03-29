class CreateInvitedGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :invited_guests do |t|
      t.integer :event_guest
      t.integer :invited_event

      t.timestamps
    end
  end
end
