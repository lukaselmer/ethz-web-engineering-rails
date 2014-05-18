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
end
