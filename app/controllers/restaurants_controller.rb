class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [ :show ]
  # same as self.before_action ( :set_restaurant, { :only => [ :show, :index... ] } )
  # before_action is method of ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  # i do not use form_for? no need of Restaurant.new in method new ?
  # when I don't use strong params with whitelist, no need of restaurant_params
  def create
    # Restaurant.create(
    #   name: params[:name],
    #   category: params[:category],
    #   address: params[:address],
    #   phone_number: params[:phone_number]
    # )

    # @restaurant = Restaurant.new(restaurant_params)
    # @restaurant.save

    # Restaurant.create(restaurant_params)
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :address, :phone_number)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
