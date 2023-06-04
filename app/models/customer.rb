class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum member_status: { exist: false, withdraw: true }
  
  #表示名の使用文字の条件
  VALID_DISPLAYNAME_REGEX= /\A[a-z0-9]+\z/i.
  validates :display_name, length: { in: 1..15}, presence: true, uniqueness: true, format: { with: VALID_DISPLAYNAME_REGEX, message: "は半角1~15文字英大文字・小文字・数字のみ使用可能です"}
  validates :introduciton, length:{maximum: 50}
  validates :email, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  
  has_many :item_posts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_many :item_favorites, dependent: :destroy

  has_one_attached :profile_image
end
