class MeetupGroup < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  def incepted_at
    v = read_attribute(:incepted_at)
    v || created_at
  end
end
