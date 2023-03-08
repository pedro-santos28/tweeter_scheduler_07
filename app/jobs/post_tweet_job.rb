class PostTweetJob < ApplicationJob
  queue_as :default

  def perform(post)
    return if post.published?

    response = twitter_client(post).post_tweet(text: post.body.to_plain_text)
    Rails.logger.info response

    post.update(published: true)
  end

  private

    def twitter_client(post)
      Tweetkit::Client.new do |config|
        config.bearer_token = post.user.token
        config.consumer_key = twitter_cred(:api_key)
        config.consumer_secret = twitter_cred(:api_secret)
      end
    end

    def twitter_cred(key)
      Rails.application.credentials.twitter(key)
    end
end