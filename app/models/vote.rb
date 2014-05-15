class Vote < ActiveRecord::Base
  belongs_to :membership
  belongs_to :activity

  validates :membership, :activity, presence: true
end
