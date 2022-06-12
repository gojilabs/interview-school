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
end
