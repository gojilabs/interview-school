require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    get students_root_url

    assert_response :success
  end
end
