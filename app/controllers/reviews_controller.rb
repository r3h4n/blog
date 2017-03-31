class ReviewsController < ApplicationController
  before_action :find_tutorial
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :require_user, only: [:new, :edit]

  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.tutorial_id = @tutorial.id
    @review.user_id = current_user.id
    if @review.save
      redirect_to tutorial_path(@tutorial)
    else
      render 'new'
    end
  end

  def edit

  end
  
  def update
    if @review.update(review_params)
      redirect_to tutorial_path(@tutorial)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to tutorial_path(@tutorial)
  end

  private
  
  
  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_tutorial
    @tutorial = Tutorial.find(params[:tutorial_id])
  end
  
  def find_review
    @review = Review.find(params[:id])
  end
  
end
