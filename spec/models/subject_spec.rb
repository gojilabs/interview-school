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
require 'rails_helper'

RSpec.describe Subject, type: :model do
  it 'is invalid when name is not defined' do
    subject = build(:subject, name: nil)
    expect(subject).to_not be_valid
  end
end
