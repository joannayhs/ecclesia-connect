require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get session_create_url
    assert_response :success
  end

  test "should get destory" do
    get session_destory_url
    assert_response :success
  end

end
