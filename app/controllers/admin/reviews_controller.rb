module Admin
  class ReviewsController < ApplicationController
    def create
      service = ReviewsService.new(params[:reviews].open).call
      redirect_to admin_root_path, flash: service.result
    end
  end
end
