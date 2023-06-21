class Review < ApplicationRecord
  validates :title, presence: true, length: {in: 1..20}
  validates :impression, length: {in: 1..150}
  validates :item_price, length:{maximum: 15}
  validates :star, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5
  }, presence: true
  
  belongs_to :customer
  belongs_to :item_post
end
