class MeetupGroup < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :memberships

  validates :topic, :home_town, :incepted_at, :owner_id, presence: true


  after_create do
    Membership.create!(user: owner, meetup_group: self)
  end

  def incepted_at
    v = read_attribute(:incepted_at)
    v || created_at
  end

  def to_s
    topic
  end
end
