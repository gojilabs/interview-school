# == Schema Information
#
# Table name: sections
#
#  id           :integer          not null, primary key
#  day          :integer          not null
#  end_time     :integer          not null
#  start_time   :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  classroom_id :integer          not null
#  subject_id   :integer          not null
#  teacher_id   :integer          not null
#
# Indexes
#
#  index_sections_on_classroom_id  (classroom_id)
#  index_sections_on_subject_id    (subject_id)
#  index_sections_on_teacher_id    (teacher_id)
#
# Foreign Keys
#
#  classroom_id  (classroom_id => classrooms.id)
#  subject_id    (subject_id => subjects.id)
#  teacher_id    (teacher_id => teachers.id)
#
class Section < ApplicationRecord
  attribute :start_time, :session_time

  belongs_to :teacher
  belongs_to :subject
  belongs_to :classroom

  validates :day, numericality: { in: 1..7 }
  validates :duration, inclusion: { in: [50, 80] }
  validates :start_time, presence: { message: 'Start time is incorrect format' }

  validates :start_time, :numericality => {
    only_integer: true,
    greater_than_or_equal_to: 7 * 60 + 30,
    message: 'start time should be greater than or equal to 7:30am'
  }

  validates :end_time, :numericality => {
    only_integer: true,
    less_than_or_equal_to: 22 * 60,
    message: 'start time should be less than or equal to 10:00pm'
  }

  def duration
    end_time - start_time
  end

  def duration=(val)
    self.end_time = self.start_time + val
  end
end
