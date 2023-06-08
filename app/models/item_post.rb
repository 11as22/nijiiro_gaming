class ItemPost < ApplicationRecord
  validates :item_name, presence: true, length: { in: 1..50}
  validates :item_explanation, presence: true, length: { in: 1..200 }
  validates :model_number, length: {maximum:30}
  
  has_many :item_favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :item_genre
  belongs_to :customer
  
  has_one_attached :item_image
  
  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_item_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
