class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :user_type, :phone, :date_of_birth
end
