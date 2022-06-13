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
require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it 'is invalid when first name is not defined' do
    teacher = build(:teacher, first_name: nil)
    expect(teacher).to_not be_valid
  end

  it 'is invalid when last name is not defined' do
    teacher = build(:teacher, last_name: nil)
    expect(teacher).to_not be_valid
  end
end
