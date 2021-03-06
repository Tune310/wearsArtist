class UsersController < ApplicationController
  before_action :authorize, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to user_arts_path(@user.id)
    else
      render :new
  end
end


  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end

end
