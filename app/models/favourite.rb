class Favourite < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :dog
end
