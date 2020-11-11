class Review < ApplicationRecord
  validates :content, presence: true, length: { minimum: 20 }
  validates :rating, inclusion: { in: (0..5) }
  validates :rating, numericality: { only_integer: true }
  belongs_to :restaurant
end