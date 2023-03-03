class PostsController < ApplicationController
  before_action :new_post, only: %i[index]
  before_action :all_posts, only: %i[index create]

  def index

  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to root_path
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