require "test_helper"

class JwtAuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should get generate_token" do
    get jwt_authentication_generate_token_url
    assert_response :success
  end

  test "should get verify_token" do
    get jwt_authentication_verify_token_url
    assert_response :success
  end
end
