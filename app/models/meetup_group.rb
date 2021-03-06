class MeetupGroup < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :memberships
  has_many :activities

  validates :topic, :home_town, :incepted_at, :owner_id, presence: true

  after_create do
    Membership.create!(user: owner, meetup_group: self)
  end

  def activities_archive
    activities.archive
  end

  def popular_upcoming_activities
    activities.upcoming.popular
  end

  def incepted_at
    v = read_attribute(:incepted_at)
    v || created_at
  end

  def to_s
    topic
  end
end
