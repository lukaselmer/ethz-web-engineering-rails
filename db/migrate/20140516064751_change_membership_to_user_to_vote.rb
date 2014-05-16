class ChangeMembershipToUserToVote < ActiveRecord::Migration
  def change
    add_reference :votes, :user, index: true
    Vote.all.each do |v|
      v.user = v.membership.user
      v.save!
    end
    remove_reference :votes, :membership, index: true
  end
end
