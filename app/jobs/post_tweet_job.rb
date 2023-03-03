class PostTweetJob < ApplicationJob
  queue_as :default

  def perform(post)
    tweeter_client.post_tweet(text: post.body)
  end

  private

    def twitter_client
      client = Tweetkit::Client.new do |config|
        config.bearer_token = post.user.token
        config.consumer_key = tweeter_cred(:api_key)
        config.consumer_secret = tweeter_cred(:api_secret)
      end
    end

    def twitter_cred(key)
      Rails.application.credentials.twitter(key)
    end
end