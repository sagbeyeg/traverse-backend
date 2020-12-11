class Review < ApplicationRecord
  belongs_to :location
  belongs_to :user

  validates :location_id, :user_id, :title, :rating, :content, presence: true
end
