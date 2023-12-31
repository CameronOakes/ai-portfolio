class AddUsernameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :admin, :boolean, default: false
    add_column :users, :name, :string
  end
end
