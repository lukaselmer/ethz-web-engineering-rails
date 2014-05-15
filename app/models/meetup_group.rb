class MeetupGroup < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  validates :topic, :home_town, :incepted_at, :owner_id, presence: true

  def incepted_at
    v = read_attribute(:incepted_at)
    v || created_at
  end

  def to_s
    topic
  end
end
