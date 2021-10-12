class Section < ApplicationRecord
  enum day: Date::DAYNAMES

  belongs_to :teacher_subject

  has_many :students, class_name: 'StudentSection'
  has_many :times, class_name: 'SectionTime'
end
