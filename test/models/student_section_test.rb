require 'test_helper'

class StudentSectionTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture student_sections
  end

  test 'validate successful save' do
    teacher = Teacher.create first_name: 'Brian', last_name: 'Nguyen'
    subject = Subject.create name: 'Geography'
    teacher_subject = TeacherSubject.create teacher: teacher, subject: subject
    section = Section.create teacher_subject: teacher_subject
    student = Student.create first_name: 'Brian', last_name: 'Nguyen'

    student_section = StudentSection.new section: section, student: student
    assert student_section.save
  end
end
