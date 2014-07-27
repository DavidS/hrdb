class AddUserToPeople < ActiveRecord::Migration
  def change
    add_column :people, :login, :string
    add_index :people, :login
    add_column :people, :crypted_password, :string
    add_column :people, :password_salt, :string
    add_column :people, :persistence_token, :string
    add_index :people, :persistence_token
    add_column :people, :login_count, :integer
    add_column :people, :last_request_at, :datetime
    add_index :people, :last_request_at
    add_column :people, :last_login_at, :datetime
    add_column :people, :current_login_at, :datetime
    add_column :people, :last_login_ip, :string
    add_column :people, :current_login_ip, :string
  end
end
