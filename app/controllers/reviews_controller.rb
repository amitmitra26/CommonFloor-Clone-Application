class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end


  def new

    @property = Property.find(params[:property_id])
    @review = Review.new

  end

  def create

    @property = Property.find(params[:property_id])
    @review = @property.reviews.create(params.require(:review).permit(:title,:comment))

    if @review.save
      @review.user_id = current_user.id
      @review.save
      flash[:success] = "Review Submitted"
     redirect_to property_review_path(@property,@review)
   else
     render 'new'
   end
 end

def show
  @review = Review.find(params[:id])
end

  def approval
    @review = Review.find(params[:review_id])
  end


  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(params.require(:review).permit(:status))
      @review.approved_by = current_user.id
      @review.save
      flash[:success] = "Review Status Updated"
      redirect_to reviews_path
    else
      render 'approval'
    end
  end

end
