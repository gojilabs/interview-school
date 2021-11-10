# == Schema Information
#
# Table name: teachers
#
#  id         :integer          not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Teacher < ApplicationRecord
  has_many :teacher_subjects, dependent: :destroy
  has_many :subjects, through: :teacher_subjects
  accepts_nested_attributes_for :teacher_subjects, allow_destroy: true

  validates :first_name, :last_name, presence: true

  def first_and_last_name
    "#{first_name} #{last_name}"
  end
end
