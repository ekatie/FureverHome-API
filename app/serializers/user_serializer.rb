class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :user_type
end
