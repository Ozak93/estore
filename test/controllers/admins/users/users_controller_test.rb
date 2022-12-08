require "test_helper"

class Admins::Users::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_users_users_index_url
    assert_response :success
  end
end
