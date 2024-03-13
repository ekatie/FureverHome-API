class MatchCalculator

  # Define ranges for sizes and ages
  SIZE_RANGES = {
    "Tiny" => 0..19,
    "Small" => 2..29,
    "Medium" => 30..49,
    "Large" => 50..90,
    "Giant" => 91..1000
  }.freeze

  AGE_RANGES = {
    'Puppy' => 0..1,
    'Young' => 1..3,
    'Adult' => 3..8,
    'Senior' => 8..Float::INFINITY
  }.freeze

  GOOD_WITH_VALUES_SCORE = {
    'Yes' => 2,
    'Sometimes' => 1
    'No' => -1,
    'Untested' => 0
  }.freeze

def self.match(application, dogs)
  dogs.map do |dog|
    match_score = 0
    total_criteria = 0

    # Energy level matching
    if application.dog_energy_level == dog.energy_level
      match_score += 2
    elsif application.dog_energy_level == 'Flexible'
      match_score += 1
    else
      match_score -= 1
    end
    total_criteria += 2


    # Size and Age matching
    [application.dog_size, application.dog_age].each do |preferences|
      preferences.each do |preference|
        range = preference == 'size' ? SIZE_RANGES[preference] : AGE_RANGES[preference]
        if range&.cover?(dog.send(preference))
          match_score += 2
        end
      end
      total_criteria += 2 * preferences.size
    end

    # Compatibility with cats and dogs
    ['cats', 'dogs'].each do |pet_type|
      if application.current_pets_details&.downcase&.split&.any? { |word| word.match(/#{pet_type}|#{pet_type.singularize}/) }
        good_with_value = dog.send("good_with_#{pet_type}")
        match_score += GOOD_WITH_VALUES_SCORE[good_with_value] || 0
        total_criteria += 2
      end
    end

    # Compatibility with children
    if application.household_children
      match_score += GOOD_WITH_VALUES_SCORE[dog.good_with_kids] || 0
      total_criteria += 2
    end

    # Consideration for medical conditions
    if application.dog_medical_conditions == 'Yes' || application.dog_medical_conditions == 'Maybe'
      match_score += 1
      total_criteria += 1
    end

    # Calculate match percentage, ensuring total_criteria is never zero to avoid division by zero
    total_criteria = 1 if total_criteria.zero?
    match_percentage = (match_score.to_f / total_criteria * 100).round

    { dog: dog, match_percentage: match_percentage }

     # Sort by highest match percentage
    end.sort_by { |match| -match[:match_percentage] }
  end
end