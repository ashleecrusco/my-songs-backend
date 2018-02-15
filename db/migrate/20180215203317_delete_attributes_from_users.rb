class DeleteAttributesFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :password_digest, :string
    remove_column :users, :name, :string
    add_column :users, :username, :string
  end
end
