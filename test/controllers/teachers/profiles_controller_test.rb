require 'test_helper'

class Teachers::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get teachers_profiles_new_url
    assert_response :success
  end

  test "should get create" do
    get teachers_profiles_create_url
    assert_response :success
  end

end
