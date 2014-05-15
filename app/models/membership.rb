class Membership < ActiveRecord::Base
  belongs_to :meetup_group
  belongs_to :user

  validates :meetup_group, :user, presence: true
end
