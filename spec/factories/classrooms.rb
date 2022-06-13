# == Schema Information
#
# Table name: classrooms
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_classrooms_on_name  (name) UNIQUE
#
require 'faker'

FactoryBot.define do
  factory :classroom do
    name { Faker::Educator.campus }
  end
end