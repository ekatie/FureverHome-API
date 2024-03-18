class DogSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :sex, :breed, :size, :description, :status, :energy_level, :foster_location, :medical_conditions, :adoption_fee, :is_favourite, :dog_images_attributes, :good_with_cats, :good_with_dogs, :good_with_kids, :social_media_link

  def is_favourite
    Rails.logger.info "Current scope (user): #{scope.inspect}"
    object.is_favourite(scope)
  end

  def dog_images_attributes
    object.dog_images.map do |image|
      {
        id: image.id,
        url: image.url,
        is_default: image.is_default,
        _destroy: false
      }
    end
  end
  
end
