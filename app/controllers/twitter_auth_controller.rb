class TwitterAuthController < ApplicationController
  def create
    token = request.env.dig("omniauth.auth", :credentials, :token)
    current_user.update(token: token)
    redirect_to root_path, notice: "Twitter account connected."
  end
end