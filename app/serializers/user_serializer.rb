class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :password, :age, :bio, :address, :city, :state, :country, :zipcode
end
