class Student < ApplicationRecord
  has_many :student_sections
  has_many :enrolled_sections, source: :section, through: :student_sections

  def first_and_last_name
    "#{first_name} #{last_name}"
  end
end
