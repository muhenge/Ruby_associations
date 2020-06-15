class ApplicationController < ActionController::Base

  def current_user
    if session[:auth]
      @current_user = User.find(session[:auth]['id'])
    end
  end
end
