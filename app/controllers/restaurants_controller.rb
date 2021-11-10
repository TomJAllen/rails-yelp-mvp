class RestaurantsController < ApplicationController

  before_action :get_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

  def get_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end


# A visitor can see the list of all restaurants.
# GET "restaurants"
# A visitor can add a new restaurant, and be redirected to the show view of that new restaurant.
# GET "restaurants/new"
# POST "restaurants"
# A visitor can see the details of a restaurant, with all the reviews related to the restaurant.
# GET "restaurants/38"
# A visitor can add a new review to a restaurant
# GET "restaurants/38/reviews/new"
# POST "restaurants/38/reviews"
