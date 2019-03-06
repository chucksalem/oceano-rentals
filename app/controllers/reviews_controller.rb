class ReviewsController < ApplicationController
  def index
  end

  def reviews
    @reviews = Review.all
  end
  helper_method :reviews
end
