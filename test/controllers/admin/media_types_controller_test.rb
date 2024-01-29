require "test_helper"

class Admin::MediaTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_media_type = admin_media_types(:one)
  end

  test "should get index" do
    get admin_media_types_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_media_type_url
    assert_response :success
  end

  test "should create admin_media_type" do
    assert_difference("Admin::MediaType.count") do
      post admin_media_types_url, params: { admin_media_type: {  } }
    end

    assert_redirected_to admin_media_type_url(Admin::MediaType.last)
  end

  test "should show admin_media_type" do
    get admin_media_type_url(@admin_media_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_media_type_url(@admin_media_type)
    assert_response :success
  end

  test "should update admin_media_type" do
    patch admin_media_type_url(@admin_media_type), params: { admin_media_type: {  } }
    assert_redirected_to admin_media_type_url(@admin_media_type)
  end

  test "should destroy admin_media_type" do
    assert_difference("Admin::MediaType.count", -1) do
      delete admin_media_type_url(@admin_media_type)
    end

    assert_redirected_to admin_media_types_url
  end
end
