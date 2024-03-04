class DogSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :sex, :breed, :size, :description, :status, :energy_level, :foster_location, :medical_conditions, :adoption_fee, :default_image_url

  def default_image_url
    object.dog_images.find_by(is_default: true)&.url
  end
end
