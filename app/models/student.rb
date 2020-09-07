# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Student < ApplicationRecord
  has_many :students_sections
  has_many :sections, through: :students_sections

  # @return Hash
  # key is day of the week, value is array of busy timeslots
  def schedule
    schedule = {}
    sections.map do |section|
      section.days.map do |day|
        schedule[day].to_a << (section.start_at..section.end_at)
      end
    end
    schedule
  end
end
