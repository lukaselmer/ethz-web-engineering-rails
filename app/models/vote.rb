class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  validates :user, :activity, presence: true
end
