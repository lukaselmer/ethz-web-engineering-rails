class Activity < ActiveRecord::Base
  belongs_to :meetup_group

  validates :name, :location, :start_at, :duration, :description, :meetup_group, presence: true
  validates :description, length: {minimum: 20}
  validates :duration, numericality: {greater_than_or_equal_to: 15}

  validate do
    errors.add(:start_at, 'must be in the future') if start_at < Time.now
  end

  def to_s
    "#{name}, #{start_at}"
  end

  def ends_at
    start_at + duration.minutes
  end
end
