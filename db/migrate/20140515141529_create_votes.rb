class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :membership, index: true, null: false
      t.references :activity, index: true, null: false

      t.timestamps
    end
  end
end
