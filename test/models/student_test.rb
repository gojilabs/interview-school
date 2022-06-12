# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  level      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
