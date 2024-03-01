class DogImage < ApplicationRecord
  belongs_to :dog

  before_save :unset_previous_default, if: :is_default?
  
    validates :url, presence: true
    validates :is_default, inclusion: { in: [true, false] }
  
    private
  
    def unset_previous_default
      DogImage.where(dog_id: dog_id, is_default: true).update_all(is_default: false)
    end
end
