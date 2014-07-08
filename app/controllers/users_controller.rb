class UsersController < ApplicationController

	before_action :find_user, only: [:show, :edit, :update]

  def index
     @user_posts = Post.all
  end

	def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
  end 

  def update

  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:sucess] = "Signed Up Successfully"
  		redirect_to explore_path
  	else
  		render :new
  	end
  end

  protected

  def user_params
  	params.require(:user).permit(:email, :password, :avatar)
  end

  def find_user
    @user = User.find_by(email: params[:id])
  end

end

