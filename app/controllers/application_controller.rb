class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include PropertiesHelper
  include UsersHelper
  before_action :require_login

  private
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_path
      end
    end

    def admin_login
      unless current_user.is_admin
        flash[:error] = "You are not Permitted for this content"
        redirect_to user_path(current_user) # halts request cycle
      end
    end

    def already_loggedin
      if current_user
        flash[:success] = "You are already logged in"
        redirect_to current_user
      end
    end

end
