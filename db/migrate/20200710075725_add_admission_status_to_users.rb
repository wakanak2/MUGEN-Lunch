class AddAdmissionStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admission_status, :boolean, default: true, null: false
  end
end
