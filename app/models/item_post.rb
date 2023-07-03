class ItemPost < ApplicationRecord
  validates :item_name, presence: true, length: { in: 1..50}
  validates :item_explanation, presence: true, length: { in: 1..250}
  validates :model_number, length: {maximum: 30}

  has_many :item_favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :item_genre
  belongs_to :customer

  has_one_attached :item_image
  # ------ソートの記述---------
  #レビューの平均評価値が高い順,SQLから取り出し
  scope :review_rate, -> { left_joins(:reviews).group(:id).order('AVG(reviews.star) DESC') }
  #AI感情分析のスコアの高い順
  #scope :lang_score_rate, ->
  # レビュー件数の多い順
  scope :review_count, -> { includes(:reviews).sort {|a,b| b.reviews.count <=> a.reviews.count }}
  # ----------------------------

  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_item_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited?(customer)
    item_favorites.where(customer_id: customer.id).exists?
  end


end
