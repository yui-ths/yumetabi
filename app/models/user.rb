class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :comments, dependent: :destroy

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  def self.guest
    find_or_create_by!(email: 'aaa@aaa.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = 'ゲストユーザー'
      user.profile = 'ゲストユーザーです'
    end
  end
  
end
