class ItemFavorite < ApplicationRecord
  belongs_to :customer
  belongs_to :item_post
end
