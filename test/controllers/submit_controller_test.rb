require 'test_helper'

class SubmitControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get submit_index_url
    assert_response :success
  end

  test "should get show" do
    get submit_show_url
    assert_response :success
  end

  test "should get create" do
    get submit_create_url
    assert_response :success
  end

end
