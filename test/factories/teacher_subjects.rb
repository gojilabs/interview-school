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
FactoryBot.define do
  factory :teacher_subject do
    trait :math_teacher_math do
      teacher factory: [:teacher, :math]
      subject factory: [:subject, :math]
    end

    trait :math_and_english_teacher_math do
      teacher factory: [:teacher, :math_and_english]
      subject factory: [:subject, :math]
    end

    trait :math_and_english_teacher_english do
      teacher factory: [:teacher, :math_and_english]
      subject factory: [:subject, :english]
    end
  end
end
