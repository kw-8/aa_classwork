class UpdateUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email
    remove_column :users, :name
    add_column :users, :username, :string, null: false, unique: true
  end
end
