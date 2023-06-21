class ItemGenre < ApplicationRecord
   validates :genre, presence: true, length: {maximum: 15}

   has_many :item_posts, dependent: :destroy
end
  
 
