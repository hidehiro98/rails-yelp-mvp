class ReviewsController < ApplicationController

  before_action :set_restaurant, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @restaurant = Restaurant.find(@review.restaurant_id)
  end

  def new
    # why whithout @restaurant, it doesn't work?
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      # without new http request, so that the form does not loose user's input data
      render :new
    end

  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
