class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity, counter_cache: true

  validates :user, :activity, presence: true
end
