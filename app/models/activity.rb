class Activity < ActiveRecord::Base
  belongs_to :meetup_group
  has_many :votes

  validates :name, :location, :start_at, :duration, :description, :meetup_group, presence: true
  validates :description, length: {minimum: 20}
  validates :duration, numericality: {greater_than_or_equal_to: 15}

  validate do
    errors.add(:start_at, 'must be in the future') if start_at < Time.now
  end

  scope :archive, -> { where('start_at < ?', Time.now).order(start_at: :desc) }
  scope :upcoming, -> { where('start_at >= ?', Time.now) }
  scope :popular, -> { includes(:votes).order(votes_count: :desc) }
  scope :latest, -> { order(start_at: :desc) }
  scope :by_user, -> (user) { where(meetup_group_id: user.meetup_groups.ids) }

  after_update :tweet

  def to_s
    "#{name}, #{start_at}"
  end

  def ends_at
    start_at + duration.minutes
  end

  def start_at=(val)
    val = Time.parse(val, Time::DATE_FORMATS[:datetimepicker]) if val.is_a? String
    write_attribute(:start_at, val)
  end

  def vote(user)
    votes.where(user: user).first
  end

  def voted?(user)
    !vote(user).nil?
  end

  def tweet
    return unless definite_changed?(from: false, to: true)
    return unless meetup_group.owner.has_twitter?

    t = TwitterService.new(meetup_group.owner)
    t.tweet(definite_changed_tweet_message)
  end

  def definite_changed_tweet_message
    "The activity #{name} is now definite!"
  end
end
