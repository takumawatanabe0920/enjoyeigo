require 'test_helper'

class Admins::NotificationControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admins_notification_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_notification_destroy_url
    assert_response :success
  end

end
