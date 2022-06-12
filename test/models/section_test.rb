# == Schema Information
#
# Table name: sections
#
#  id           :integer          not null, primary key
#  day          :integer          not null
#  end_time     :integer          not null
#  start_time   :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  classroom_id :integer          not null
#  subject_id   :integer          not null
#  teacher_id   :integer          not null
#
# Indexes
#
#  index_sections_on_classroom_id  (classroom_id)
#  index_sections_on_subject_id    (subject_id)
#  index_sections_on_teacher_id    (teacher_id)
#
# Foreign Keys
#
#  classroom_id  (classroom_id => classrooms.id)
#  subject_id    (subject_id => subjects.id)
#  teacher_id    (teacher_id => teachers.id)
#
require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
