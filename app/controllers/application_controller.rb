class ApplicationController < ActionController::Base
  def current_user
    if session[:auth]
      @current_user = User.find(session[:auth]['id'])
    else
      redirect_to new_user_path
    end
  end
end
