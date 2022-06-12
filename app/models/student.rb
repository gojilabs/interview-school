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
  validates :first_name, :last_name, :level, presence: true
end
