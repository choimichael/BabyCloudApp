class PostsController < ApplicationController
  # before_action :authenticate_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    @posts = Post.all
  end

  def grid
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created'
    else
      render :new
    end
  end

  def update
  end

  def destroy
    @post.destroy
    redirect_to @post, notice: 'Post was deleted'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end
