class Location < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :trips, dependent: :destroy

  validate :name, uniquness: true
  validates :name, :description, presence: true
end
