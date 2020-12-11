class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :age, :address, :city, :state, :country, :zipcode, :bio
end
