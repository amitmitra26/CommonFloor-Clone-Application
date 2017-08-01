class PropertiesController < ApplicationController

  def index
    #@properties = Property.all
    @user = current_user
  end

  def new
    @user = current_user
    @property = Property.new
  end

  def create
    @user = User.find(params[:user_id])
    @property = @user.properties.create(params.require(:property).permit(:title, :description, :category, :location, :price, :area, :owner, :contact, :info))
    redirect_to @user
  end

  def show
    @user = User.find(current_user.id)
    @property = @user.properties.find(params[:id])

  end
end
