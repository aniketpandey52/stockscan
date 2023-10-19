require "test_helper"

class ScansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scan = scans(:one)
  end

  test "should get index" do
    get scans_url, as: :json
    assert_response :success
  end

  test "should create scan" do
    assert_difference('Scan.count') do
      post scans_url, params: { scan: { color: @scan.color, name: @scan.name, tag: @scan.tag } }, as: :json
    end

    assert_response 201
  end

  test "should show scan" do
    get scan_url(@scan), as: :json
    assert_response :success
  end

  test "should update scan" do
    patch scan_url(@scan), params: { scan: { color: @scan.color, name: @scan.name, tag: @scan.tag } }, as: :json
    assert_response 200
  end

  test "should destroy scan" do
    assert_difference('Scan.count', -1) do
      delete scan_url(@scan), as: :json
    end

    assert_response 204
  end
end
