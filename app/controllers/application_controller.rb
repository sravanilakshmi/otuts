class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  layout proc{ |c| c.request.xhr? ? false : "application" }

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    @current_user = current_user_session && current_user_session.record
  end

  def user_logged_in
    session[:return_to] = request.url
    redirect_to new_user_session_path if current_user.nil?
  end

end

