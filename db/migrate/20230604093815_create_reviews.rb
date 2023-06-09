class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id, null: false
      t.integer :item_post_id, null: false
      t.string :title, null: false
      t.text :impression, null: false
      t.string :item_price
      t.float :star, null: false, default: 3
      t.decimal :lang_score, precision: 5, scale: 3
      t.timestamps
    end
  end
end
