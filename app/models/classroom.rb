class Classroom < ApplicationRecord
  belongs_to :building, optional: true

  validates :room_number, presence: true
end
