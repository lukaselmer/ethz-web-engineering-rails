class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :managing_meetup_groups, foreign_key: :owner_id, class_name: 'MeetupGroup'
  has_many :meetup_groups, through: :memberships
  has_many :memberships

  def to_s
    "#{name} (#{email})"
  end

  def can_vote_for?(activity)
    meetup_groups.exists?(id: activity.meetup_group.id)
  end
end
