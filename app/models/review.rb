class Review < ApplicationRecord
  validates :first_name, :last_name, :unit_id, :description, :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
