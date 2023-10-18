require "test_helper"

class AntennasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @antenna = antennas(:one)
  end

  test "should get index" do
    get antennas_url, as: :json
    assert_response :success
  end

  test "should create antenna" do
    assert_difference("Antenna.count") do
      post antennas_url, params: { antenna: { cpa: @antenna.cpa, location: @antenna.location } }, as: :json
    end

    assert_response :created
  end

  test "should show antenna" do
    get antenna_url(@antenna), as: :json
    assert_response :success
  end

  test "should update antenna" do
    patch antenna_url(@antenna), params: { antenna: { cpa: @antenna.cpa, location: @antenna.location } }, as: :json
    assert_response :success
  end

  test "should destroy antenna" do
    assert_difference("Antenna.count", -1) do
      delete antenna_url(@antenna), as: :json
    end

    assert_response :no_content
  end
end
