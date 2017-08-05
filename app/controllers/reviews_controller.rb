class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end


  def new
    @user = current_user
    @property = @user.properties.find(params[:property_id])
    @review = Review.new
  end

  def create
    @user = User.find(params[:user_id])
    @property = Property.find(params[:property_id])
    @review = @user.@property.reviews.create(params.require(:review).permit(:title,:comment))
    if @review.save
      flash[:success] = "Review Submitted"
     redirect_to @review
   else
     render 'new'
   end
 end




  

end
