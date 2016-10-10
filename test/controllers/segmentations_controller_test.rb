require 'test_helper'

class SegmentationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @segmentation = segmentations(:one)
  end

  test "should get index" do
    get segmentations_url
    assert_response :success
  end

  test "should get new" do
    get new_segmentation_url
    assert_response :success
  end

  test "should create segmentation" do
    assert_difference('Segmentation.count') do
      post segmentations_url, params: { segmentation: { name: @segmentation.name } }
    end

    assert_redirected_to segmentation_url(Segmentation.last)
  end

  test "should show segmentation" do
    get segmentation_url(@segmentation)
    assert_response :success
  end

  test "should get edit" do
    get edit_segmentation_url(@segmentation)
    assert_response :success
  end

  test "should update segmentation" do
    patch segmentation_url(@segmentation), params: { segmentation: { name: @segmentation.name } }
    assert_redirected_to segmentation_url(@segmentation)
  end

  test "should destroy segmentation" do
    assert_difference('Segmentation.count', -1) do
      delete segmentation_url(@segmentation)
    end

    assert_redirected_to segmentations_url
  end
end
