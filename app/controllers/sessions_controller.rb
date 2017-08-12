class SessionsController < ApplicationController
skip_before_action :require_login, only: [:new, :create]
before_action :already_loggedin, only: [:new, :create]
    def new

    end

    def create
      user = User.find_by(email: params[:session][:email].downcase)
      user_name = User.find_by(name: params[:session][:name])
      if (user && user.authenticate(params[:session][:password])) || (user_name && user_name.authenticate(params[:session][:password]))
        if user_name
          user = user_name
        end
        if log_in user
          if current_user.is_admin?
            redirect_to admin_users_path(current_user)
          else
            redirect_to user
          end

        end
      else
        flash.now[:danger] = 'Invalid Login Credentials'
        render 'new'
      end
    end


    def destroy
     log_out
     redirect_to root_url
   end
end
