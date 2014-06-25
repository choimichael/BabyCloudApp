class UsersController < ApplicationController

	before_action :find_user, only: [:show, :edit, :update]

	def new
  	@user = User.new
  end

  def show
  end

  def edit
  end

  def update

  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:sucess] = "Signed Up Successfully"
  		redirect_to :root
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

