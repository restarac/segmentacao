require 'test_helper'

class SegmentationTest < ActiveSupport::TestCase

    test "should apply filter" do
        seg = Segmentation.new(name: "Contacts By Age")
        seg.filter = NumberSegmentationFilter.new(name: "igual")
        value = 25
        result = seg.search! Contact
        assert_equal "something?", result
    end

end
