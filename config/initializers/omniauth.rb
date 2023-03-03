Rails.application.config.middleware.use OmniAuth::Builder do
  client_id = Rails.application.credentials.twitter[:client_id]
  client_secret = Rails.application.credentials.twitter[:client_secret]

  provider :twitter2, client_id, client_secret,
    callback_path: '/auth/twitter/callback',
    scope: "tweet.read users.read tweet.write"
end

OmniAuth.config.allowed_request_methods = [:post, :get] if Rails.env.development?