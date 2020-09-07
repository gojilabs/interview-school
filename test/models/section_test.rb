# == Schema Information
#
# Table name: sections
#
#  id                 :bigint           not null, primary key
#  days               :integer          default([]), is an Array
#  duration           :integer
#  start_at           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  teacher_subject_id :bigint           not null
#
# Indexes
#
#  index_sections_on_teacher_subject_id  (teacher_subject_id)
#
# Foreign Keys
#
#  fk_rails_...  (teacher_subject_id => teacher_subjects.id)
#
require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
