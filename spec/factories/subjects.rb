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
require 'faker'

FactoryBot.define do
  factory :subject do
    name { Faker::Educator.course_name }
  end
end
