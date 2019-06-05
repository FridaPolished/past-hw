class AddIndexToUsers < ActiveRecord::Migration[5.2]
  def change

    remove_column :users, :username, :string
    remove_column :users, :password_digest, :string
    remove_column :users, :session_token, :string 

    add_column :users, :username, :string, null: false
    add_column :users, :password_digest, :string, null: false
    add_column :users, :session_token, :string,  null: false

    add_index :users, :username, unique: true
    add_index :users, :session_token, unique: true
  end
end
