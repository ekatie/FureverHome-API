require "test_helper"

class Api::V1::Admin::DogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get api_v1_admin_dogs_new_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_admin_dogs_create_url
    assert_response :success
  end

  test "should get index" do
    get api_v1_admin_dogs_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_admin_dogs_show_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_admin_dogs_update_url
    assert_response :success
  end
end
