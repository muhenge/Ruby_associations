class SessionsController < ApplicationController
  def login
    @user = User.new
  end

  def check
    @current_user = User.where(username: user_params['username']).first
    if @current_user
      flash.notice = 'You are login'
      session[:auth] = @current_user
      redirect_to new_user_path
    else
      flash.notice = 'Incorrect login'
      redirect_to new_session_path
    end
  end

  def destroy
    session.destroy
    redirect_to new_user_path
    flash.notice = 'deconnexion successfully'
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
