class ChangePasswordInUsers < ActiveRecord::Migration[7.2]
  def change
    rename_column :users, :password, :password_digest
  end
end
