class TwitterService
  def initialize(user)
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret = Rails.application.secrets.twitter_consumer_secret
      config.access_token = user.twitter_access_token
      config.access_token_secret = user.twitter_access_token_secret
    end
  end

  def tweet(message)
    @client.update(message)
  end

  def tweet_with_media(image_url, message)
    require 'open-uri'
    open(image_url) do |f|
      @client.update_with_media(message, f)
    end
  end

  def tweet_activity_update(activity)
    url = UrlHelper.new.load_activity_url(activity)
    message = "The activity #{activity.name} is now definite! #{url}"
    if valid_url?(activity.image_url)
      tweet_with_media(activity.image_url, message)
    else
      tweet(message)
    end
  end

  def valid_url?(url)
    regex = /^http\:\/\/farm\d\d?\d?\.staticflickr\.com\//
    !regex.match(url).nil?
  end

  class UrlHelper
    include Rails.application.routes.url_helpers

    def load_activity_url(activity)
      activity_url(activity, host: Rails.application.config.action_controller.default_url_options[:host],
                   port: Rails.application.config.action_controller.default_url_options[:port],
                   protocol: Rails.application.config.action_controller.default_url_options[:protocol])
    end
  end
end
