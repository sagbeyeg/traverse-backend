class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :trips, dependent: :destroy

  has_many :follower_relationships, foreign_key: :following_id , class_name: "Friendship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :following_relationships, foreign_key: :follower_id, class_name: "Friendship", dependent: :destroy
  has_many :following, through: :following_relationships

  validates :email, :username ,uniqueness: true 
  validates :email, :username, :name, :age, :password, :address, :bio, :city, :state, :country, :zipcode, presence: true

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def following?(user_id)
    following.include?(user_id)
  end
end
