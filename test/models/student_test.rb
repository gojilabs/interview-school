require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture students
  end

  test 'validate successful save' do
    student = Student.new first_name: 'Brian', last_name: 'Nguyen'

    assert student.save
  end
end
