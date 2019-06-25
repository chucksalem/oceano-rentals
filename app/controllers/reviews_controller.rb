class ReviewsController < ApplicationController
  def index
  end

  def reviews
    @reviews = Review.all
  end

  def property
    reviews = Review.where(unit_id: params[:id])
    render json: reviews
  end

  helper_method :reviews
end
