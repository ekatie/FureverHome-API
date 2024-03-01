class ApplicationDogMatch < ApplicationRecord
  belongs_to :application
  belongs_to :dog

  validates :match_percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
