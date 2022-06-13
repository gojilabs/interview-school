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
require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'is invalid when first name is not defined' do
    student = build(:student, first_name: nil)
    expect(student).to_not be_valid
  end

  it 'is invalid when last name is not defined' do
    student = build(:student, last_name: nil)
    expect(student).to_not be_valid
  end

  it 'is invalid when last level is not defined' do
    student = build(:student, level: nil)
    expect(student).to_not be_valid
  end
end
