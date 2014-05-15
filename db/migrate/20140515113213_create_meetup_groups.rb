class CreateMeetupGroups < ActiveRecord::Migration
  def change
    create_table :meetup_groups do |t|
      t.references :owner, index: true, null: false
      t.string :topic, default: '', null: false
      t.date :incepted_at, null: false
      t.string :home_town, default: '', null: false

      t.timestamps
    end
  end
end
