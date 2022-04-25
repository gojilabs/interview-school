class Section < ApplicationRecord
  enum week_days: {
    'M/W/F': 0,
    'T/TH': 1,
    'M/T/W/TH/F': 2
  }

  has_many :student_sections, dependent: :destroy
  has_many :students, through: :student_sections
  accepts_nested_attributes_for :student_sections, allow_destroy: true

  has_many :teacher_sections, dependent: :destroy
  has_many :teachers, through: :teacher_sections
  accepts_nested_attributes_for :teacher_sections, allow_destroy: true

  has_many :classroom_sections, dependent: :destroy
  has_many :classrooms, through: :classroom_sections
  accepts_nested_attributes_for :classroom_sections, allow_destroy: true

  belongs_to :subject

  def description
    "#{self.subject.name}, \
    teachers: #{self.teachers.map(&:first_and_last_name).join(',')}, \
    classroom:#{self.classrooms.map(&:numeral).join(',')}"
  end
end
