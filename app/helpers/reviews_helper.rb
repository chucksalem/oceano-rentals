# frozen_string_literal: true

module ReviewsHelper
  def reviewer(review)
    review.first_name + ' ' + review.last_name
  end
end
