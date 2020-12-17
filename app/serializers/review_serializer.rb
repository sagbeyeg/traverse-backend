class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :location_id, :user_id, :title, :rating, :content
  # belongs_to :location
  # belongs_to :user
end
