require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture sections
  end

  test 'validate successful save' do
    teacher = Teacher.create first_name: 'Brian', last_name: 'Nguyen'
    subject = Subject.create name: 'Geography'
    teacher_subject = TeacherSubject.create teacher: teacher, subject: subject

    section = Section.new teacher_subject: teacher_subject
    assert section.save
  end
end
