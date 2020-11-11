class RestaurantsController < ApplicationController

  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
    @restaurant_reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  # def edit
  # end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  # def update
  #   if @restaurant.update(restaurant_params)
  #     redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating, :phone_number, :category)
  end
end
