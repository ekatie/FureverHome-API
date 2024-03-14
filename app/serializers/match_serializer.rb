class MatchSerializer < ActiveModel::Serializer
  attributes :match_percentage

  has_one :dog, serializer: DogSerializer

  def dog
    object[:dog]
  end

  def match_percentage
    object[:match_percentage]
  end
end
