require 'test_helper'

class SegmentationFilterTest < ActiveSupport::TestCase

    test "should USE the NumberFilter to mount_condition" do
        filter = SegmentationFilter.new(type: "NumberSegmentationFilter", name: "igual a")
        where_filter = filter.mount_condition("age")
        assert_equal "age = ?", where_filter
    end

    test "should USE the TextFilter to mount_condition" do
        filter = SegmentationFilter.new(type: "TextSegmentationFilter", name: "igual a")
        where_filter = filter.mount_condition("age")
        assert_equal "age like ?", where_filter
    end

    test "should return nil to mount_condition" do
        filter = SegmentationFilter.new(type: "SegmentationFilter", name: "igual a")
        where_filter = filter.mount_condition("age")
        assert_nil where_filter, "nothing is better than something!"
    end

    test "should treat_value Number" do
        filter = SegmentationFilter.new(type: "NumberSegmentationFilter", name: "maior que")
        assert_equal 20, filter.treat_value(20)
    end

    test "should treat_value Text" do
        filter = SegmentationFilter.new(type: "TextSegmentationFilter", name: "termina com")
        assert_equal "%gmail.com", filter.treat_value("gmail.com")
    end
end