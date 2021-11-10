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
FactoryBot.define do
  factory :subject do
    math

    trait :math do
      name { "Math" }
      description { "All about numbers" }
    end

    trait :english do
      name { "English" }
      description { "Language that everyone knows" }
    end

    trait :without_teacher do
      name { "Subject without teacher" }
    end
  end
end
