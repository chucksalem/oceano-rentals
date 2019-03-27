# frozen_string_literal: true

module Admin
  class ReviewsController < AdminController
    def index
      @q = Review.ransack(params[:q])
      @reviews = @q.result
    end

    def edit; end

    def update
      review.update!(review_params)
      redirect_to edit_admin_review_path(review), flash: { success: 'Review has been updated successfully!' }
    end

    def create
      service = ReviewsService.new(params[:reviews].open).call
      redirect_to admin_root_path, flash: service.result
    end

    def destroy
      review.destroy!
      redirect_to admin_reviews_path, flash: { success: 'Review has been removed successfully!' }
    end

    private

    def reviews
      @reviews ||= Review.all
    end
    helper_method :reviews

    def review
      @review ||= Review.find(params[:id])
    end
    helper_method :review

    def review_params
      params.require(:review).permit(:first_name, :last_name, :description, :rating)
    end
  end
end
