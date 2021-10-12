class Student < ApplicationRecord

  has_many :enrolled_sections, class_name: 'StudentSection'

  def first_and_last_name
    "#{first_name} #{last_name}"
  end
end
