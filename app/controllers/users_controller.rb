class UsersController < ApplicationController
  def new
  @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = 'User created'
      redirect_to new_user_path
    else
      flash.notice = 'User not created'
      render 'new'
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
