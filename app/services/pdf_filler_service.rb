require 'pdf_forms'

# Fill PDF form with application data
class PdfFillerService

  def self.pdftk_path
    '/usr/bin/pdftk'
  end
  
  def self.fill_adoption_agreement(application)
    adopter_name = application.user.name
    dog_name = application.dog.name
    dog_age = application.dog.age.to_s
    dog_sex = application.dog.sex
    adoption_fee = application.dog.adoption_fee.to_i.to_s
    today_date = Date.today.strftime('%B %d, %Y')

    file_path = Rails.root.join('app', 'assets', 'Dog_Adoption_Contract_Template.pdf').to_s
    new_file_name = Rails.root.join('app', 'assets', "Dog_Adoption_Contract_#{application.id}.pdf").to_s
    final_file_name = Rails.root.join('app', 'assets', "Prefilled_Dog_Adoption_Contract_#{application.id}.pdf").to_s

    form_data = {
      'adopter_name' => adopter_name,
      'dog_name' => dog_name,
      'dog_age' => dog_age,
      'dog_sex' => dog_sex,
      'adoption_fee' => adoption_fee,
      'date' => today_date,
      'admin_name' => 'Katie Kucsera',
      'admin_title' => 'Furever Home Representative'
    }

    form_reader = PdfForms.new(pdftk_path)
    form_reader.fill_form(file_path, new_file_name, form_data)
    new_file_name
  end
end