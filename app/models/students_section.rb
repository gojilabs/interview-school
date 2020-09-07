# == Schema Information
#
# Table name: students_sections
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :bigint           not null
#  student_id :bigint           not null
#
# Indexes
#
#  index_students_sections_on_section_id  (section_id)
#  index_students_sections_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id)
#  fk_rails_...  (student_id => students.id)
#
class StudentsSection < ApplicationRecord
  belongs_to :student
  belongs_to :section

  before_save :validate_student_schedule

  # Validate is student able to add this section to his timeline
  def validate_student_schedule
    schedule = student.schedule
    schedule.days.any? do |day|
      schedule[day].any? do |timeslot|
        timeslot.overlaps? (section.start_at..section.end_at)
      end
    end
  end
end
