require "test_helper"

class Admin::AblumsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_ablums_index_url
    assert_response :success
  end
end
