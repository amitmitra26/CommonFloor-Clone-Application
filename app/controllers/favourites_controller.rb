class FavouritesController < ApplicationController

  def index
    @user = current_user

  end


  def create
    @property = Property.find(params[:property_id])
    @favourite = @property.favourites.create(params.require(:favourite).permit(:interested))
    @favourite.user= current_user
    #@favourite.interested = params[:favourite][:interested]
    if @favourite.save
      msg = "Property added to your favourite List"
      if @favourite.interested
        flash[:success] = msg + " and Property is marked as Interested"
        UserMailer.property_interested(@property,current_user).deliver_now

      else
        flash[:success] = msg + " and Property is not marked as Interested"
      end
      redirect_to favourites_path
    else

      flash[:error] = @favourite.errors.full_messages.first
      redirect_to favourites_path
    end

  end

  def update
    @favourite = Favourite.find(params[:id])
    if @favourite.update_attributes(params.require(:favourite).permit(:interested))
      msg = "Property Updated to your favourite List"
      if @favourite.interested
        flash[:success] = msg + " and Property is marked as Interested"
        UserMailer.property_interested(@favourite.property,current_user).deliver_now
      else
        flash[:success] = msg + " and Property is not marked as Interested"
      end
      redirect_to favourites_path
      else

      flash[:error] = @favourite.errors.full_messages.first
      redirect_to favourites_path
      end

      end

      def destroy
        Favourite.find(params[:id]).destroy
        flash[:success] = "Removed from your Favourite List"
        redirect_to favourites_path
      end
end
