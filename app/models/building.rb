class Building < ApplicationRecord
  has_many :classrooms, class_name: 'Classroom', dependent: :destroy
  
  validates :name, presence: true
end
