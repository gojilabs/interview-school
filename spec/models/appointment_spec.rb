# == Schema Information
#
# Table name: appointments
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :integer          not null
#  student_id :integer          not null
#
# Indexes
#
#  index_appointments_on_section_id  (section_id)
#  index_appointments_on_student_id  (student_id)
#
# Foreign Keys
#
#  section_id  (section_id => sections.id)
#  student_id  (student_id => students.id)
#
require 'rails_helper'

RSpec.describe Appointment, type: :model do
  context 'when attempt to create duplicate appointment' do
    let(:student) { create(:student) }
    let(:section) { create(:section) }

    before do
      create(:appointment, student: student, section: section)
    end

    it 'raises validation error' do
      expect {
        create(:appointment, student: student, section: section)
      }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Section has already been taken')
    end

  end

  context 'when student has already scheduled a section on this time' do
    let(:day) { 2 }
    let(:duration) { 50 }
    let(:start_time_human_1) { '4:00PM' }
    let(:start_time_human_2) { '4:30PM' }
    let(:student) { create(:student) }

    let(:section_1) do
      create(:section,
             day: day,
             duration: duration,
             start_time_human: start_time_human_1
      )
    end

    let(:section_2) do
      create(:section,
             day: day,
             duration: duration,
             start_time_human: start_time_human_2
      )
    end

    let!(:overlapped) do
      create(:appointment,
             student: student,
             section: section_1
      )
    end

    it 'is invalid' do
      appointment = build(:appointment, student: student, section: section_2)
      expect(appointment).to_not be_valid
      expect(appointment.errors.messages[:section])
        .to eq ["the section overlaps with existing appointment, subject: #{section_1.teacher_subject.subject.name}, day: #{section_1.day}, time: #{section_1.start_time_human}, duration: #{section_1.duration}"]
    end
  end
end
