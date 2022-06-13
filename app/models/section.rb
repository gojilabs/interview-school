# == Schema Information
#
# Table name: sections
#
#  id                 :integer          not null, primary key
#  day                :integer          not null
#  duration           :integer          not null
#  end_time           :integer          not null
#  start_time         :integer          not null
#  start_time_human   :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  classroom_id       :integer          not null
#  teacher_subject_id :integer          not null
#
# Indexes
#
#  index_sections_on_classroom_id        (classroom_id)
#  index_sections_on_teacher_subject_id  (teacher_subject_id)
#
# Foreign Keys
#
#  classroom_id        (classroom_id => classrooms.id)
#  teacher_subject_id  (teacher_subject_id => teacher_subjects.id)
#
class Section < ApplicationRecord
  include HumanTime

  belongs_to :teacher_subject
  belongs_to :classroom

  before_validation :set_start_time, :set_end_time

  validates :day, numericality: { in: 1..7 }
  validates :duration, inclusion: { in: [50, 80] }
  validates_presence_of :start_time_human
  validates_format_of :start_time_human, :with => HUMAN_TIME_REGEX
  validate :validate_time
  validate :validate_intersections

  private

  def set_start_time
    self.start_time = cast_time(start_time_human)
  end

  def set_end_time
    if start_time
      self.end_time = start_time + duration
    end
  end

  def validate_time
    if start_time
      errors.add(:start_time_human, "can't be earlier than 7:30AM") if start_time < 7 * 60 + 30
      errors.add(:duration, "can't continue later than 10:00pm") if end_time > 22 * 60
    end
  end

  def validate_intersections
    overlapped = teacher_subject
                   .sections
                   .where(day: day)
                   .where(':start_time < end_time AND :end_time > end_time', {
                     start_time: start_time,
                     end_time: end_time
                   }).first

    if overlapped
      message = "the section overlaps with existing one, subject: #{teacher_subject.subject.name}, day: #{overlapped.day}, time: #{overlapped.start_time_human}, duration: #{overlapped.duration}"
      errors.add(:start_time_human, message)
    end
  end
end
