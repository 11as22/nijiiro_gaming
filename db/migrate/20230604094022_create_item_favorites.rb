class CreateItemFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :item_favorites do |t|
      t.integer :customer_id, null: false
      t.integer :item_post_id, null: false

      t.timestamps
    end
  end
end
