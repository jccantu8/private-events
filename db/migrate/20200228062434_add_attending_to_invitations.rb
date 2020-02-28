class AddAttendingToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_column :invitations, :attending, :boolean
  end
end
