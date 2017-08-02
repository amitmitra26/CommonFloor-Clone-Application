class PropertiesController < ApplicationController

  def index
    @user = current_user
  end
  def home
    @properties = Property.all
  end
  def new
    @user = current_user
    @property = Property.new
  end

  def create
    @user = User.find(params[:user_id])
    @property = @user.properties.create(params.require(:property).permit(:title, :description, :category, :location, :price, :area, :owner, :contact, :info, :bedrooms, :bathrooms))
    if @property.save
      flash[:success] = "Property Submitted"
    redirect_to @property
  else
    render 'new'
  end
  end

  def view
    @property = Property.find(params[:property_id])
  end

  def show
    @user = User.find(current_user.id)
    @property = @user.properties.find(params[:id])
  end

  def edit
    #@user = User.find(current_user.id)
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(params.require(:property).permit(:title, :description, :category, :location, :price, :area, :owner, :contact, :info, :status, :bedrooms, :bathrooms))
      flash[:success] = "Property Added"
      redirect_to user_property_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    Property.find(params[:id]).destroy
    flash[:success] = "Property Deleted"
    redirect_to current_user
  end

end
