class AddUsernameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string, default: "", null: false, unique: true
    add_index :users, :username, name: "index_users_on_username", unique: true
  end
end
