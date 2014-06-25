class PostsController < ApplicationController
  # before_action :authenticate_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    @user_posts = current_user.posts.reverse
  end

  def grid
    @posts = Post.all.reverse
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      render json: { message: "success" }, :status => 200
    else
      #  you need to send an error header, otherwise Dropzone
      #  will not interpret the response as an error:
      render json: { error: @post.errors.full_messages.join(',')}, :status => 400
    end
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path
    else
      render 'edit'
    end
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
