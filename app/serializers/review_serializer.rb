class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :location_id, :user_id, :title, :rating, :content, :location, :user
  # belongs_to :location
  # belongs_to :user
  # has_one :user
end
