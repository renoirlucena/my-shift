require "test_helper"

class ExchangesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get exchanges_index_url
    assert_response :success
  end

  test "should get show" do
    get exchanges_show_url
    assert_response :success
  end

  test "should get new" do
    get exchanges_new_url
    assert_response :success
  end

  test "should get create" do
    get exchanges_create_url
    assert_response :success
  end

  test "should get destroy" do
    get exchanges_destroy_url
    assert_response :success
  end

  test "should get update" do
    get exchanges_update_url
    assert_response :success
  end

  test "should get edit" do
    get exchanges_edit_url
    assert_response :success
  end
end
