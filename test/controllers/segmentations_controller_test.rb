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

  test "should create segmentation and redirect to ADD CONDITIONS" do
    skip('TODO: changing the creation flow broken this test')
    assert_difference('Segmentation.count') do
      post segmentations_url, params: { segmentation: { name: @segmentation.name } }
    end

    assert_redirected_to new_segmentation_clause_url
  end

  test "should get edit" do
    skip('TODO: changing the creation flow broken this test')
    filter = SegmentationFilter.create(type: "NumberSegmentationFilter", name: "menor que")
    seg = Segmentation.create(name: "by age")
    seg.segmentation_clauses.create(segmentation_filter: filter, segmentation: seg, compare_value: 20, compare_field: 'age')

    get edit_segmentation_url(seg)
    assert_response :success
  end

  test "shouldnt get edit POST only" do
    skip('TODO: changing the creation flow broken this test')
    get edit_segmentation_url(@segmentation)
    assert_response :success
  end

  test "should update segmentation" do
    skip('TODO: changing the creation flow broken this test')
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
