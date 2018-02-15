class AddAttributesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :display_name, :string
    add_column :users, :followers, :integer
    add_column :users, :spotify_uri, :string
    add_column :users, :external_urls, :string
    add_column :users, :access_token, :string
    add_column :users, :refresh_token, :string
    add_column :users, :image, :string
  end
end
