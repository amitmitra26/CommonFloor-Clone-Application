class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :already_loggedin, only: [:new, :create]
  before_action :admin_login, only: [:index, :destroy]
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_auth

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @property = Property.new
    @properties_visited = property_visited_load
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to CommonFloor"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    property_visited_delete(user)
    user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :mobile, :password, :password_confirmation, :uid)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.is_admin
    end

    def set_auth
       @auth = session[:omniauth] if session[:omniauth]
     end
end
