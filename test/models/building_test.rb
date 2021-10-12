require 'test_helper'

class BuildingTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture buildings
  end

  test 'validate name presence' do
    building = Building.new name: ''
    building.save
    assert building.errors[:name].present?
  end

  test 'validate successful save' do
    building = Building.new name: 'East Wing'
    assert building.save 
  end
end
