require 'test_helper'

class SegmentationWorkspaceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get segmentation_workspace_index_url
    assert_response :success
  end

  test "should get run" do
    get segmentation_workspace_run_url
    assert_response :success
  end

end
