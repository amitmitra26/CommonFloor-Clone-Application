class FavouritesController < ApplicationController

  def index


  end


  def create
    @property = Property.find(params[:property_id])
    @favourite = @property.favourites.create(params.require(:favourite).permit(:interested))
    @favourite.user= current_user
    if @favourite.save
      flash[:success] = "Property added to your favourite List"
      redirect_to current_user
    else

      flash[:error] = @favourite.errors.full_messages.first
      redirect_to current_user
    end

  end

end
