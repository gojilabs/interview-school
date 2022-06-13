# == Schema Information
#
# Table name: teacher_subjects
#
#  id         :integer          not null, primary key
#  level      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer          not null
#  teacher_id :integer          not null
#
# Indexes
#
#  index_teacher_subjects_on_subject_id                 (subject_id)
#  index_teacher_subjects_on_teacher_id                 (teacher_id)
#  index_teacher_subjects_on_teacher_id_and_subject_id  (teacher_id,subject_id) UNIQUE
#
# Foreign Keys
#
#  subject_id  (subject_id => subjects.id)
#  teacher_id  (teacher_id => teachers.id)
#
RSpec.describe TeacherSubject, type: :model do
  context 'when level is not set' do
    it 'sets level 5 by default' do
      teacher_subject = build(:teacher_subject)
      expect(teacher_subject.level).to eql 5
    end
  end

  context 'when level is set' do
    it 'correctly replaces default value' do
      teacher_subject = build(:teacher_subject, level: 6)
      expect(teacher_subject.level).to eql 6
    end
  end

  context 'when attempt to create duplicate assignment' do
    let(:subject) { create(:subject) }
    let(:teacher) { create(:teacher) }

    before do
      create(:teacher_subject, teacher: teacher, subject: subject)
    end

    it 'raises validation error' do
      expect {
        create(:teacher_subject, teacher: teacher, subject: subject)
      }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Teacher has already been taken')
    end
  end
end
