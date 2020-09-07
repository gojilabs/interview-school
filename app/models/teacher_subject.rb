# == Schema Information
#
# Table name: teacher_subjects
#
#  id         :bigint           not null, primary key
#  level      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :bigint           not null
#  teacher_id :bigint           not null
#
# Indexes
#
#  index_teacher_subjects_on_subject_id                 (subject_id)
#  index_teacher_subjects_on_teacher_id                 (teacher_id)
#  index_teacher_subjects_on_teacher_id_and_subject_id  (teacher_id,subject_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (subject_id => subjects.id)
#  fk_rails_...  (teacher_id => teachers.id)
#
class TeacherSubject < ApplicationRecord
  DEFAULT_LEVEL = 5

  belongs_to :teacher
  belongs_to :subject

  validates :teacher, uniqueness: {scope: :subject}, if: :_not_marked_for_destruction?

  validates :level, presence: true
  before_validation :_default_values_on_create, on: :create

  def _default_values_on_create
    self.level ||= DEFAULT_LEVEL
    # return value should be true or nil
    true
  end

  def _not_marked_for_destruction?
    # Rails validation does not work well when we update subject with
    # teacher_subjects_attributes when we mark_for_destruction
    subject.teacher_subjects.none?(&:_destroy)
  end
end
