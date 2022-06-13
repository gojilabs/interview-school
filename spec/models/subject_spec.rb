require 'rails_helper'

RSpec.describe Subject, type: :model do
  it 'is invalid when name is not defined' do
    subject = build(:subject, name: nil)
    expect(subject).to_not be_valid
  end
end
