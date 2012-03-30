class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :signed_in?
  
  def current_user
    User.find(session[:current_user_id]) rescue nil
  end
  
  def signed_in?
    current_user.nil?
  end
end
