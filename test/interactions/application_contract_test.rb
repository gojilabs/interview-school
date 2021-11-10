require 'test_helper'

module ApplicationContractTest
  class ValidateParamsTest < ActiveSupport::TestCase
    phone_contract = Class.new(ApplicationContract) do
      params do
        required(:phone).filled(:string)
      end
    end

    test 'returns success if params are valid' do
      result = phone_contract.new.validate_params(phone: '123', id: 32)
      assert_equal(result.success, phone: '123')
    end

    test 'returns failure if params are invalid' do
      result = phone_contract.new.validate_params({})
      assert_interaction_error(result)
    end

    test 'works with action controller params' do
      params = ActionController::Parameters.new(phone: '123', id: 321)
      result = phone_contract.new.validate_params(params)
      assert_equal(result.success, phone: '123')
    end
  end
end
