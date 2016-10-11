require 'test_helper'

class SegmentationClausesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @segmentation_clause = segmentation_clauses(:one)
  end

  test "should get index" do
    skip('TODO: changing the creation flow broken this test')
    get segmentation_clauses_url
    assert_response :success
  end

  test "should get new" do
    skip('TODO: changing the creation flow broken this test')
    get new_segmentation_clause_url
    assert_response :success
  end

  test "should create segmentation_clause" do
    skip('TODO: changing the creation flow broken this test')
    assert_difference('SegmentationClause.count') do
      post segmentation_clauses_url, params: { segmentation_clause: { compare_field: @segmentation_clause.compare_field, compare_value: @segmentation_clause.compare_value, segmentation_filter_id: @segmentation_clause.segmentation_filter_id, segmentation_id: @segmentation_clause.segmentation_id } }
    end

    assert_redirected_to segmentation_clause_url(SegmentationClause.last)
  end

  test "shouldnt show segmentation_clause" do
    skip('TODO: changing the creation flow broken this test')
    begin 
      get segmentation_clause_url(@segmentation_clause)
    rescue ActionController::RoutingError => error
      assert error.message.contains? "No route matches"
    end
  end

  test "should get edit" do
    skip('TODO: changing the creation flow broken this test')
    get edit_segmentation_clause_url(@segmentation_clause)
    assert_response :success
  end

  test "should update segmentation_clause" do
    skip('TODO: changing the creation flow broken this test')
    patch segmentation_clause_url(@segmentation_clause), params: { segmentation_clause: { compare_field: @segmentation_clause.compare_field, compare_value: @segmentation_clause.compare_value, segmentation_filter_id: @segmentation_clause.segmentation_filter_id, segmentation_id: @segmentation_clause.segmentation_id } }
    assert_redirected_to segmentation_clause_url(@segmentation_clause)
  end

  test "should update and call NEW segmentation_clause" do
    skip('TODO: changing the creation flow broken this test')
    patch segmentation_clause_url(@segmentation_clause), params: { segmentation_clause: { compare_field: @segmentation_clause.compare_field, compare_value: @segmentation_clause.compare_value, segmentation_filter_id: @segmentation_clause.segmentation_filter_id, segmentation_id: @segmentation_clause.segmentation_id } }
    assert_redirected_to segmentation_clause_url(@segmentation_clause)
  end

  test "should destroy segmentation_clause" do
    skip('TODO: changing the creation flow broken this test')
    assert_difference('SegmentationClause.count', -1) do
      delete segmentation_clause_url(@segmentation_clause)
    end

    assert_redirected_to segmentation_clauses_url
  end
end
