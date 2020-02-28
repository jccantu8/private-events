class Invitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.integer :invitor_id
      t.integer :invitee_id
      t.integer :invited_events_id

      t.timestamps
    end
    add_foreign_key :invitations, :users, column: :invitor_id
    add_foreign_key :invitations, :users, column: :invitee_id
    add_foreign_key :invitations, :events, column: :invited_events_id
  end
end
