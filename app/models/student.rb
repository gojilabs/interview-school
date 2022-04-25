class Student < ApplicationRecord
  has_many :student_sections, dependent: :destroy
  has_many :sections, through: :student_sections
  accepts_nested_attributes_for :student_sections, allow_destroy: true

  validates :name, :surname, :year, presence: true

  def first_and_last_name
    "#{name} #{surname}"
  end
end
