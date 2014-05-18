class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :managing_meetup_groups, foreign_key: :owner_id, class_name: 'MeetupGroup'
  has_many :memberships
  has_many :meetup_groups, through: :memberships
  has_many :managing_activities, through: :meetup_groups, class_name: 'Activity', source: :activities

  def to_s
    "#{name} (#{email})"
  end

  def can_vote_for?(activity)
    meetup_groups.exists?(id: activity.meetup_group.id)
  end

  def update_twitter_auth(token, secret)
    update_attributes!(twitter_access_token: token, twitter_access_token_secret: secret)
  end

  def has_twitter?
    twitter_access_token.present? && twitter_access_token_secret.present?
  end
end
