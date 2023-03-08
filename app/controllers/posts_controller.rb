class PostsController < ApplicationController
  before_action :new_post, only: %i[index]
  before_action :all_posts, only: %i[index create]

  def index

  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      PostTweetJob.set(wait_until: @post.published_at).perform_later(@post)
      redirect_to root_path, notice: "Tweet saved."
    else
      render action: :index, status: :unprocessable_entity
    end
  end

  private

    def post_params
      params.require(:post).permit(:published_at, :body)
    end

    def new_post
      @post = Post.new
    end

    def all_posts
      @posts = Post.all
    end
end