class PropertiesController < ApplicationController
  skip_before_action :require_login, only: [:home, :show]
  before_action :admin_login, only: [:adminUser]
  before_action :correct_property, only: [:edit, :delete, :update]

  def index
    @user = current_user
  end

  def new
    @user = current_user
    @property = Property.new
  end

  def create
    @user = User.find(params[:user_id])
    @property = @user.properties.create(params.require(:property).permit(:title, :description, :category, :location, :price, :area, :owner, :contact, :info, :bedrooms, :bathrooms, :owner_type, :rooms, :city, :picture))
    if @property.owner_type == "I need a Property"
      @property.status = "Needed"
    end
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

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(params.require(:property).permit(:title, :description, :category, :location, :price, :area, :owner, :contact, :info, :status, :bedrooms, :bathrooms, :rooms, :city, :picture))
      flash[:success] = "Property Added"
      redirect_to user_property_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    property=Property.find(params[:id])
    visited_property_delete(property)
    property.destroy
    flash[:success] = "Property Deleted"
    redirect_to current_user
  end

  def adminUser
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
    unless current_user == @property.user
      @property.viewers = @property.viewers + 1
      @property.save
    end
    if logged_in?
      unless (current_user == @property.user)
        property_visited(@property)
       UserMailer.property_visited(@property,current_user).deliver_now
      end
    end
    @favourite = Favourite.find_by(user_id: current_user, property_id: @property)
  end

  private
   def correct_property
     @property = Property.find(params[:id])
     unless (current_user.is_admin)
       if current_user != @property.user
         flash[:danger] = "You are Not Authorize to this Property Operations"
         redirect_to root_path
       end
     end
   end

end
