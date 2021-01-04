class Review < ApplicationRecord
  belongs_to :location
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validates :location_id, :user_id, :title, :rating, :content, presence: true
end
