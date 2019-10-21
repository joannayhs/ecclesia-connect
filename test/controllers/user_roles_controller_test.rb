require 'test_helper'

class UserRolesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_roles_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_roles_destroy_url
    assert_response :success
  end

end
