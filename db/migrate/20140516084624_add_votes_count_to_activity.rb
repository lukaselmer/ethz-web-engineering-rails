class AddVotesCountToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :votes_count, :integer, default: 0, null: false
    Activity.all.each(&:update_counters)
    Activity.all.each { |a| Activity.reset_counters(a.id, :votes) }
  end
end
