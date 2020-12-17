class TripSerializer < ActiveModel::Serializer
  attributes :id, :location_id, :user_id, :start_date, :end_date, :note
  # belongs_to :location
  # belongs_to :user
end
