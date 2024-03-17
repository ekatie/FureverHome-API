class DogImageSerializer < ActiveModel::Serializer
  attributes :id, :url, :is_default, :created_at, :updated_at
end
