class Classroom < ApplicationRecord
  belongs_to :building, optional: true
end
