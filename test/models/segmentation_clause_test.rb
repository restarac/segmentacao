require 'test_helper'

class SegmentationClauseTest < ActiveSupport::TestCase

    test "should compare using NumberFilter" do
        filter = SegmentationFilter.new(type: "NumberSegmentationFilter", name: "igual a")
        clause = SegmentationClause.new(segmentation_filter: filter, compare_value: 10, compare_field: "age")
        where = clause.mount_where
        assert_equal "age = ?", where
    end

    test "should compare using TextFilter" do
        filter = SegmentationFilter.new(type: "TextSegmentationFilter", name: "igual a")
        clause = SegmentationClause.new(segmentation_filter: filter, compare_value: 10, compare_field: "name")
        where = clause.mount_where
        assert_equal "name like '?'", where
    end
end