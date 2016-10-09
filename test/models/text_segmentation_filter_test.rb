require 'test_helper'

class TextSegmentationFilterTest < ActiveSupport::TestCase

    test "apply 'igual' filter" do
        filter = TextSegmentationFilter.new(name: "igual a")
        value = 25
        where_filter = filter.with("age")
        assert_equal "age like '?'", where_filter
    end

    test "apply 'contém' filter" do
        filter = TextSegmentationFilter.new(name: "contém")
        value = 25
        where_filter = filter.with("age")
        assert_equal "age like '%?%'", where_filter
    end

    test "apply 'termina' filter" do
        filter = TextSegmentationFilter.new(name: "termina com")
        value = 25
        where_filter = filter.with("age")
        assert_equal "age like '%?'", where_filter
    end

    test "apply 'começa com' filter" do
        filter = TextSegmentationFilter.new(name: "começa com")
        value = 25
        where_filter = filter.with("age")
        assert_equal "age like '?%'", where_filter
    end

    test "apply unknown filter" do
        filter = TextSegmentationFilter.new(name: "igual ou maior")
        value = 25
        where_filter = filter.with("age")
        assert_equal "age like '?'", where_filter, "same as the 'igual'"
    end
end
