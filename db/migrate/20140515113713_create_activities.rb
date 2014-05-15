class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name, default: '', null: false
      t.string :location, default: '', null: false
      t.datetime :start_at
      t.integer :duration, default: 60, null: false
      t.text :description, default: '', null: false
      t.references :meetup_group, index: true, null: false
      t.boolean :definite, default: false, null: false

      t.timestamps
    end
  end
end
