module ActivitiesHelper
  def attached_image(activity)
    if activity.image_url.blank?
      image_tag 'https://lorempixel.com/g/800/800/', class: 'activity-image'
    else
      image_tag activity.image_url, class: 'activity-image'
    end
  end
end
