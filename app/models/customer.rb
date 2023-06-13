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
  
  # フォローをした、フォローをされたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  
  # フォロー・フォロワーの一覧画面で、customer.followersという記述でフォロワーを表示したいので、throughでスルーするテーブル、sourceで参照するカラムを指定。
  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower


  has_one_attached :profile_image
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_profile_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  # ゲストサインイン機能
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.password_confirmation = customer.password
      customer.display_name = "guest9999"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
  
  #-----フォロー,フォロワー機能-------
  def follow(customer_id)
    relationships.create(followed_id: customer_id)
  end
  # フォローを外すときの処理
  def unfollow(customer_id)
    relationships.find_by(followed_id: customer_id).destroy
  end
  # フォローしているか判定
  def following?(customer)
    followings.include?(customer)
  end
 #--------------------------

end
