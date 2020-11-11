class ReviewsController < ApplicationController
  before_action :find_restaurant, except: [:destroy]

  # def new
  #   @review = Review.new
  # end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save # happy path
      redirect_to restaurant_path(@restaurant)
    else # unhappy path
      render :new
      # renders the html template for the 'new' action
      # while still in the create action
    end
  end

  # def destroy
  #   @review = Review.find(params[:id])
  #   @review.destroy
  #   redirect_to restaurants_path
  # end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
