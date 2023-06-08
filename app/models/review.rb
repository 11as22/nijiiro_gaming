class Review < ApplicationRecord
  validates :title, presence: true, length: {in: 1..50}
  validates :impression, length: {in: 1..300}
  validates :item_price, length:{maximum: 15 }
  validates :star, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
  
  belongs_to :customer
  belongs_to :item_post
  has_many :review_comments, dependent: :destroy
end
