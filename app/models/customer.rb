class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum member_status: { exist: false, withdraw: true }
  
  #表示名の使用文字の条件 1~15文字以上
  validates :display_name, length: { in: 1..15}, presence: true, uniqueness: true, format: { with: /\A[a-z0-9]+\z/ }
  validates :introduction, length:{maximum: 50}
  validates :email, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  
  has_many :item_posts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_many :item_favorites, dependent: :destroy

  has_one_attached :profile_image
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_profile_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
