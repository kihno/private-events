class AddHostToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :host_id, :integer
  end
end
