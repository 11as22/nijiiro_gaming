class CreateItemPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :item_posts do |t|
      t.integer :customer_id, null: false
      t.integer :item_genre_id, null: false
      t.string :item_name, null: false
      t.text :item_explanation, null: false
      t.string :model_number

      t.timestamps
    end
  end
end
