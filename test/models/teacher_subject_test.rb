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
