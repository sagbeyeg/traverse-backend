class Location < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :trips, dependent: :destroy
  
  validates :name, uniqueness: true
  validates :name, :description, presence: true
end
