require "test_helper"

class StaticPages::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get static_pages_home_index_url
    assert_response :success
  end
end
