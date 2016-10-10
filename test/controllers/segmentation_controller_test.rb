require 'test_helper'

class SegmentationControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get segmentation_name:string_url
    assert_response :success
  end

end
