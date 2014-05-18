class AddTwitterAccessToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_access_token, :string, null: false, default: ''
    add_column :users, :twitter_access_token_secret, :string, null: false, default: ''
  end
end
