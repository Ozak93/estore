require "test_helper"

class Admins::StoreOwnersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_store_owners_index_url
    assert_response :success
  end
end
