require "test_helper"

class VariablesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get variables_index_url
    assert_response :success
  end

  test "should get show" do
    get variables_show_url
    assert_response :success
  end
end
