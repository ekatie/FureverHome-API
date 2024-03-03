require "test_helper"

class Api::V1::StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get api_v1_static_pages_about_url
    assert_response :success
  end

  test "should get home" do
    get api_v1_static_pages_home_url
    assert_response :success
  end
end
