class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :followed_id, :follower_id
end
