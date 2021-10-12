require 'test_helper'

class ClassroomTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture classrooms
  end

  test 'validate name presence' do
    classroom = Classroom.new name: ''
    classroom.save
    assert classroom.errors[:name].present?
  end

  test 'validate successful save' do
    classroom = Classroom.new name: 'Quad 1A'
    assert classroom.save 
  end
end
