# == Schema Information
#
# Table name: sections
#
#  id                 :integer          not null, primary key
#  day                :integer          not null
#  duration           :integer          not null
#  end_time           :integer          not null
#  start_time         :integer          not null
#  start_time_human   :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  classroom_id       :integer          not null
#  teacher_subject_id :integer          not null
#
# Indexes
#
#  index_sections_on_classroom_id        (classroom_id)
#  index_sections_on_teacher_subject_id  (teacher_subject_id)
#
# Foreign Keys
#
#  classroom_id        (classroom_id => classrooms.id)
#  teacher_subject_id  (teacher_subject_id => teacher_subjects.id)
#
require 'rails_helper'

RSpec.describe Section, type: :model do
  context 'when human start time has invalid format' do
    it 'is invalid' do
      section = build(:section, start_time_human: '17:00PM')
      expect(section).to_not be_valid
      expect(section.errors.messages[:start_time_human]).to eq ['is invalid']
    end
  end

  context 'when human start time has valid format' do
    it 'is valid' do
      section = build(:section, start_time_human: '7:00PM')
      expect(section).to be_valid
    end
  end

  context 'when duration has invalid value' do
    it 'is invalid' do
      section = build(:section, duration: 23)
      expect(section).to_not be_valid
      expect(section.errors.messages[:duration]).to eq ['is not included in the list']
    end
  end

  context 'when duration has valid value' do
    it 'is valid' do
      section = build(:section, duration: 80)
      expect(section).to be_valid
    end
  end

  context 'when day has valid value' do
    it 'is valid' do
      section = build(:section, day: Faker::Number.between(from: 1, to: 7))
      expect(section).to be_valid
    end
  end

  context 'when day has invalid value' do
    it 'is invalid' do
      section = build(:section, day: 8)
      expect(section).to be_valid
    end
  end

  context 'when start time is too early' do
    it 'is invalid' do
      section = build(:section, start_time_human: '7:00AM' )
      expect(section).to_not be_valid
      expect(section.errors.messages[:start_time_human]).to eq ["can't be earlier than 7:30AM"]
    end
  end

  context 'when end time is too late' do
    it 'is invalid' do
      section = build(:section, start_time_human: '9:30PM' )
      expect(section).to_not be_valid
      expect(section.errors.messages[:duration]).to eq ["can't continue later than 10:00pm"]
    end
  end

  context 'when teacher has already scheduled a section on this time' do
    let(:teacher_subject) { create(:teacher_subject) }
    let(:day) { 2 }
    let(:duration) { 50 }
    let(:start_time_human) { '4:00PM' }
    let!(:overlapped) do
      create(:section,
        teacher_subject: teacher_subject,
        day: day,
        start_time_human: start_time_human
      )
    end

    it 'is invalid' do
      section = build(:section, teacher_subject: teacher_subject, day: day, start_time_human: '4:30PM')
      expect(section).to_not be_valid
      expect(section.errors.messages[:start_time_human])
        .to eq ["the section overlaps with existing one, subject: #{teacher_subject.subject.name}, day: #{day}, time: #{start_time_human}, duration: #{duration}"]
    end
  end
end
