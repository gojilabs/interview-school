require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  test 'validate first_name last_name presence' do
    teacher = Teacher.create first_name: ''
    assert teacher.errors[:first_name].present?
    assert teacher.errors[:last_name].present?
  end
  test 'valid fixture' do
    assert_valid_fixture teachers
  end
end
