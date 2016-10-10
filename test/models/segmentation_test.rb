require 'test_helper'

class SegmentationTest < ActiveSupport::TestCase

    test "should find 2 contacts" do
        filter = SegmentationFilter.create(type: "NumberSegmentationFilter", name: "maior que")
        seg = Segmentation.create(name: "by age")
        clause = SegmentationClause.create(segmentation_filter: filter, segmentation: seg, compare_value: 10, compare_field: "age")
        result = seg.search! "Contact"
        puts result
        assert_equal 2, result.size
    end

end
