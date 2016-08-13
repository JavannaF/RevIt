class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms a logged-in owners.
    def logged_in_owner
      unless logged_in_owner?
        store_location
        flash[:danger] = "Please log in."
        redirect_to loginowners_url
      end
    end

end
