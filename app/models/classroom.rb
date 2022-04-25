class Classroom < ApplicationRecord
  has_many :classroom_sections, dependent: :destroy
  has_many :sections, through: :classroom_sections
  accepts_nested_attributes_for :classroom_sections, allow_destroy: true

  validates :numeral, presence: true
end
