# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  level      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Student < ApplicationRecord
  has_many :appointments
  validates :first_name, :last_name, :level, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
