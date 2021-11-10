# == Schema Information
#
# Table name: subjects
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture subjects
  end

  test 'validate name presence' do
    subject = Subject.new name: ''
    subject.save
    assert subject.errors[:name].present?
  end
end
