class Review < ApplicationRecord
  belongs_to :restaurant

  validates :restaurant_id, presence: true
  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
  validates :rating, acceptance: { accept: [0, 1, 2, 3, 4, 5] }
end


# A review must belong to a restaurant.
# A review must have content and a rating.
# A review’s rating must be a number between 0 and 5.
