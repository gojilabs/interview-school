require 'faker'

FactoryBot.define do
  factory :teacher_subject do
    teacher
    subject
  end
end