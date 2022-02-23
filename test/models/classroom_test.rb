require 'test_helper'

class ClassroomTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture classrooms
  end

  test 'validate room_number and building presence' do
    classroom = Classroom.new room_number: '', building: nil
    classroom.save
    assert classroom.errors[:room_number].present?
    assert classroom.errors[:building].present?
  end

  test 'validate successful save' do
    building = Building.new name: 'Quadrangle'
    classroom = Classroom.new room_number: 'A', building: building, floor: '1'
    assert classroom.save 
  end
end
