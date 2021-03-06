class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :age, :address, :city, :state, :country, :zipcode, :bio
  has_many :reviews
  has_many :trips 
  has_many :followers
  has_many :following
  has_many :follower_relationships
  has_many :following_relationships
end
