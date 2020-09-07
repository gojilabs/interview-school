# == Schema Information
#
# Table name: sections
#
#  id                 :bigint           not null, primary key
#  days               :integer          default([]), is an Array
#  duration           :integer
#  start_at           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  teacher_subject_id :bigint           not null
#
# Indexes
#
#  index_sections_on_teacher_subject_id  (teacher_subject_id)
#
# Foreign Keys
#
#  fk_rails_...  (teacher_subject_id => teacher_subjects.id)
#
class Section < ApplicationRecord
  has_many :students, through: :students_sections
  has_many :students_sections
  has_one :teacher_subject

  enum duration: %w{50 80}
  validate :start_at_daytime, :end_at_daytime

  def end_at
    (Time.parse(start_at) + duration.to_i.minutes).strftime('%H:%M')
  end

  private

  def start_at_daytime
    unless Time.parse(start_at) >= Time.now.change({ hour: 7, min: 30, sec: 0 })
      errors.add(:start_at, 'Section should start at least 7:30 am')
    end
  end

  def end_at_daytime
    unless Time.parse(end_at) <= Time.now.change({ hour: 22, min: 0, sec: 0 })
      errors.add(:end_at, 'Section should finish until 10:00 pm')
    end
  end
end
