require 'test_helper'

class PermitsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get permits_create_url
    assert_response :success
  end

  test "should get destroy" do
    get permits_destroy_url
    assert_response :success
  end

end
