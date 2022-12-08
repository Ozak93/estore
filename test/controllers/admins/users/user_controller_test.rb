require "test_helper"

class Admins::Users::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_users_user_index_url
    assert_response :success
  end
end
