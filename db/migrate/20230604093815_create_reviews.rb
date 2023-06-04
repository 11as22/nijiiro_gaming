class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id, null: false
      t.integer :item_posts, null: false
      t.string :title, null: false
      t.text :impression, null: false
      t.string :item_price
      t.float :rate, null: false

      t.timestamps
    end
  end
end
