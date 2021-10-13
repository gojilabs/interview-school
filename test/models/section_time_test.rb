require 'test_helper'

class SectionTimeTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture section_times
  end

  test 'validate successful save' do
    teacher = Teacher.create first_name: 'Brian', last_name: 'Nguyen'
    subject = Subject.create name: 'Geography'
    teacher_subject = TeacherSubject.create teacher: teacher, subject: subject
    section = Section.create teacher_subject: teacher_subject
    building = Building.create name: 'West Wing'
    classroom = Classroom.create room_number: '3001', building: building, floor: '1'

    section_time = SectionTime.new section: section, classroom: classroom, day: 'Tuesday', start_time: 720, duration: 50
    assert section_time.save
  end
end
