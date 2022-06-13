# == Schema Information
#
# Table name: appointments
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :integer          not null
#  student_id :integer          not null
#
# Indexes
#
#  index_appointments_on_section_id  (section_id)
#  index_appointments_on_student_id  (student_id)
#
# Foreign Keys
#
#  section_id  (section_id => sections.id)
#  student_id  (student_id => students.id)
#
class Appointment < ApplicationRecord
  belongs_to :student
  belongs_to :section

  validates :section, uniqueness: {scope: :student}
  validate :validate_intersections

  def validate_intersections
    overlapped = student
                   .appointments
                   .joins(:section)
                   .where('sections.day = :day', {
                     day: section.day
                   })
                   .where(':start_time < sections.end_time AND :end_time > sections.end_time', {
                     start_time: section.start_time,
                     end_time: section.end_time
                   }).first

    if overlapped
      message = "the section overlaps with existing appointment, subject: #{overlapped.section.teacher_subject.subject.name}, day: #{overlapped.section.day}, time: #{overlapped.section.start_time_human}, duration: #{overlapped.section.duration}"
      errors.add(:section, message)
    end
  end
end
