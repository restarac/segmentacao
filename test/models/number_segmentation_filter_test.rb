require 'test_helper'

class NumberSegmentationFilterTest < ActiveSupport::TestCase

    test "apply 'igual' filter" do
        filter = NumberSegmentationFilter.new(name: "igual a")
        where_filter = filter.mount_condition("age")
        assert_equal "age = ?", where_filter
    end

    test "apply 'menor' filter" do
        filter = NumberSegmentationFilter.new(name: "menor que")
        where_filter = filter.mount_condition("age")
        assert_equal "age < ?", where_filter
    end

    test "apply 'maior' filter" do
        filter = NumberSegmentationFilter.new(name: "maior que")
        where_filter = filter.mount_condition("age")
        assert_equal "age > ?", where_filter
    end

    test "apply unknown filter" do
        filter = NumberSegmentationFilter.new(name: "igual ou maior")
        where_filter = filter.mount_condition("age")
        assert_equal "age = ?", where_filter, "same as the 'igual'"
    end

    test 'treat_value without any change' do
        filter = NumberSegmentationFilter.new(name: "igual a")
        assert_equal 20, filter.treat_value(20)

        filter = NumberSegmentationFilter.new(name: "maior que")
        assert_equal 50, filter.treat_value(50)
    end
end
