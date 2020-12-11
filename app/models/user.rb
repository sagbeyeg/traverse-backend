class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :trips, dependent: :destroy

  validates :email, :username ,uniqueness: true 
  validates :email, :username, :name, :age, :password, :address, :bio, :city, :state, :country, :zipcode, presence: true
end
