require 'test_helper'

class InquirysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inquirys_index_url
    assert_response :success
  end

  test "should get comfirm" do
    get inquirys_comfirm_url
    assert_response :success
  end

  test "should get thanks" do
    get inquirys_thanks_url
    assert_response :success
  end

end
