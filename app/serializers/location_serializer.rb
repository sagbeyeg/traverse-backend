class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :reviews
  has_many :trips 
end
