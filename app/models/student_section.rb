class StudentSection < ApplicationRecord
  belongs_to :student
  belongs_to :section
end
