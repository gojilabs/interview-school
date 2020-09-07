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
require 'test_helper'

class TeacherSubjectTest < ActiveSupport::TestCase
  test 'uniq inidex on teacher and subject' do
    math_teacher = teachers(:math_teacher)
    math = subjects(:math)
    another_math_teacher_math = TeacherSubject.create teacher: math_teacher, subject: math
    assert another_math_teacher_math.errors[:teacher].present?
    # assert_raises(ActiveRecord::RecordNotUnique) is check manually when I
    # remove validation from model and run this test
  end

  test 'valid fixture' do
    assert_valid_fixture teachers
  end
end
