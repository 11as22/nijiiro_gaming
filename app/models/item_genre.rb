class ItemGenre < ApplicationRecord
   validates :genre, presence: true
   
   has_many :item_posts, dependent: :destroy
end
  
 
