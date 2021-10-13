class Section < ApplicationRecord
  belongs_to :teacher_subject

  has_many :students, class_name: 'StudentSection', dependent: :destroy
  has_many :times, class_name: 'SectionTime', dependent: :destroy

  accepts_nested_attributes_for :times, allow_destroy: true
end
