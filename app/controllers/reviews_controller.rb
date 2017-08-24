class ReviewsController < ApplicationController
  skip_before_action :require_login, only: [:show]
  before_action :admin_login, only: [:index, :approval]
  before_action :correct_review, only: [:edit, :delete, :update, :approve, :approval]

  def index
    @reviews = Review.all
  end

  def userReview
    @reviews = current_user.reviews
  end

  def new
    @property = Property.find(params[:property_id])
    @review = Review.new
  end

  def create
    @property = Property.find(params[:property_id])
    @review = @property.reviews.create(params.require(:review).permit(:rating,:comment))
    @review.user_id = current_user.id
    if @review.save
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

  def approve
    @review = Review.find(params[:review_id])
    if @review.update_attributes(params.require(:review).permit(:status))
      @review.approved_by = current_user.id
      @review.save
      flash[:success] = "Review is #{@review.status}"
      redirect_to reviews_path
    else
      render 'approval'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(params.require(:review).permit(:rating, :comment))
      @review.status = 'Pending'
      @review.approved_by = ''
      @review.save
      flash[:success] = "Review Status Updated, It will be Public after Admin's Approval"
      redirect_to userReview_reviews_path
    else
      render 'edit'
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "Review Removed"
    redirect_to userReview_reviews_path
  end

private
  def correct_review
    unless (current_user.is_admin)
      @review = Review.find(params[:id])
      if current_user != @review.user
        flash[:danger] = "You are Not Authorize to this Review Operations"
        redirect_to root_path
      end
    else
      @review = Review.find(params[:review_id])
    end
  end

end
