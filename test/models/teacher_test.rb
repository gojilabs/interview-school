# == Schema Information
#
# Table name: teachers
#
#  id         :integer          not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
