class Location < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :trips, dependent: :destroy
  # has_many :users, through: :trips
  
  validates :name, uniqueness: true
  validates :name, :description, presence: true
end
