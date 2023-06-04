class ItemPost < ApplicationRecord
  validates :item_name, presence: true, length: { in: 1..50}
  validates :item_explanation, length: { in: 1..200 }
  validates :model_number, length:{maximum:30}
  
  has_many :item_favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :item_genre
  belongs_to :customer
  
  has_one_attached :item_image
  
end
