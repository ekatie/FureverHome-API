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

def self.match(application, dogs)
  dogs.map do |dog|
    match_score = 0

    # Match energy level
    match_score += 1 if application.dog_energy_level == dog.energy_level

    # Match size
    if application.dog_size.any?
      application.dog_size.each do |size|
        range = SIZE_RANGES[size]
        match_score += 1 if range.cover?(dog.size)
      end
    end

    # Match age
    if application.dog_age.any?
      application.dog_age.each do |age|
        range = AGE_RANGES[age]
        match_score += 1 if range.cover?(dog.age)
      end
    end

    # Match medical conditions
    if application.dog_medical_conditions != 'No' || (application.dog_medical_conditions == 'Maybe' && dog.medical_conditions != 'None')
      match_score += 1
    end

    # Match compatibility with cats
    if application.current_pets && application.current_pets_details.include?("cats")
      match_score += 1 if dog.good_with_cats == 'Yes'
    end

     # Match compatibility with children
     match_score += 1 if application.household_children && dog.good_with_kids == 'Yes'

     total_criteria = 6 # Total number of criteria
     match_percentage = (match_score.to_f / total_criteria) * 100

    { dog: dog, match_percentage: match_percentage }

     # Sort by highest match percentage
    end.sort_by { |match| -match[:match_percentage] }
  end
end
