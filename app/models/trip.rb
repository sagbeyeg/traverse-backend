class Trip < ApplicationRecord
  belongs_to :location
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validates :location_id, :user_id, :start_date, presence: true
end
