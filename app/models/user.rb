class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :trips, dependent: :destroy

  has_many :followers, foreign_key: :followed_id , class_name: "Friendship"
  has_many :followed, through: :followers
  has_many :followed, foreign_key: :follower_id, class_name: "Friendship"
  has_many :followers, through: :followed

  validates :email, :username ,uniqueness: true 
  validates :email, :username, :name, :age, :password, :address, :bio, :city, :state, :country, :zipcode, presence: true
end
