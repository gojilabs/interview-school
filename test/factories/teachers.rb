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
FactoryBot.define do
  factory :teacher do
    first_name { "John" }
    last_name { "Teacher" }

    trait :math do
      first_name { "Math" }
    end

    trait :english do
      first_name { "English" }
    end

    trait :math_and_english do
      first_name { "Math and English" }
    end

    trait :without_subject do
      first_name { "Teacher without Subject" }
      last_name { "Still learning" }
    end
  end
end
