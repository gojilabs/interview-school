# == Schema Information
#
# Table name: students_sections
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :bigint           not null
#  student_id :bigint           not null
#
# Indexes
#
#  index_students_sections_on_section_id  (section_id)
#  index_students_sections_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id)
#  fk_rails_...  (student_id => students.id)
#
require 'test_helper'

class StudentsSectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
