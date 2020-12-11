class Trip < ApplicationRecord
  belongs_to :location
  belongs_to :user

  validates :location_id, :user_id, :start_date, presence: true
end
