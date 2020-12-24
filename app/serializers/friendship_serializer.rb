class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :following_id, :follower_id
end
