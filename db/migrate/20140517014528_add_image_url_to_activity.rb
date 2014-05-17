class AddImageUrlToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :image_url, :string, default: '', null: false
    add_column :activities, :image_link, :string, default: '', null: false
  end
end
