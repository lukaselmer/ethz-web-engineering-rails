class Activity < ActiveRecord::Base
  belongs_to :meetup_group

  def to_s
    "#{name}, #{start_at}"
  end
end
