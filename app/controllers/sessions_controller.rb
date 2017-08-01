class SessionsController < ApplicationController


    def new
    end

    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        if log_in user
          if current_user.is_admin?
            redirect_to admins_path
          else
            redirect_to user
          end
        else
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end
      end
    end


    def destroy
     log_out
     redirect_to root_url
   end
end
