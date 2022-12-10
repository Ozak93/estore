require "test_helper"

class Owners::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owners_products_index_url
    assert_response :success
  end

  test "should get new" do
    get owners_products_new_url
    assert_response :success
  end

  test "should get create" do
    get owners_products_create_url
    assert_response :success
  end

  test "should get show" do
    get owners_products_show_url
    assert_response :success
  end

  test "should get edit" do
    get owners_products_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get owners_products_destroy_url
    assert_response :success
  end
end
