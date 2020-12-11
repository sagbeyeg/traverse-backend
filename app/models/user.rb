class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :trips, dependent: :destroy

  validates :email_address, :username ,uniqueness: true 
  validates :email_address, :username, :name, :age, :password, :address, :bio, :city, :state, :country, :zipcode, presence: true
end
