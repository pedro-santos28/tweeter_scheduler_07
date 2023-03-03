class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to root_path
    else
      render action: :edit, status: :unprocessable_entity
    end
  end

  private

    def post_params
      params.require(:post).permit(:published_at, :body)
    end
end