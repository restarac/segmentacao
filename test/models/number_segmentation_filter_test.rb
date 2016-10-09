require 'test_helper'

class NumberSegmentationFilterTest < ActiveSupport::TestCase

    test "apply 'igual' filter" do
        filter = NumberSegmentationFilter.new(name: "igual a")
        value = 25
        where_filter = filter.with("age")
        assert_equal "age = ?", where_filter
    end

    test "apply 'menor' filter" do
        filter = NumberSegmentationFilter.new(name: "menor que")
        value = 25
        where_filter = filter.with("age")
        assert_equal "age < ?", where_filter
    end

    test "apply 'maior' filter" do
        filter = NumberSegmentationFilter.new(name: "maior que")
        value = 25
        where_filter = filter.with("age")
        assert_equal "age > ?", where_filter
    end

    test "apply unknown filter" do
        filter = NumberSegmentationFilter.new(name: "igual ou maior")
        value = 25
        where_filter = filter.with("age")
        assert_equal "age = ?", where_filter, "same as the 'igual'"
    end
end
