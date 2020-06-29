class UsersController < ApplicationController
  before_action :current_user, except: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = 'User created'
      session[:auth] = @user
      redirect_to new_user_path
    else
      flash.notice = 'User not created'
      render 'new'
    end
  end

  def show
    @events = current_user.events
    @events_attended = current_user.attend
    @events_past_at = current_user.attend.previously
    @events_upcoming_at = current_user.attend.upcoming
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
