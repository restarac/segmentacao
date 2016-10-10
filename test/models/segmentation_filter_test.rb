require 'test_helper'

class SegmentationFilterTest < ActiveSupport::TestCase

    test "should USE the NumberFilter" do
        filter = SegmentationFilter.new(type: "NumberSegmentationFilter", name: "igual a")
        where_filter = filter.mount_condition("age")
        assert_equal "age = ?", where_filter
    end

    test "should USE the TextFilter" do
        filter = SegmentationFilter.new(type: "TextSegmentationFilter", name: "igual a")
        where_filter = filter.mount_condition("age")
        assert_equal "age like '?'", where_filter
    end

    test "should return nil" do
        filter = SegmentationFilter.new(type: "SegmentationFilter", name: "igual a")
        where_filter = filter.mount_condition("age")
        assert_nil where_filter, "nothing is better than something!"
    end
end