require 'test_helper'

class SegmentationTest < ActiveSupport::TestCase

    test "should find 2 contacts" do
        filter = SegmentationFilter.create(type: "NumberSegmentationFilter", name: "maior que")
        seg = Segmentation.create(name: "by age")
        age_value = 10
        clause = SegmentationClause.create(segmentation_filter: filter, segmentation: seg, compare_value: age_value, compare_field: "age")
        result = seg.search! "Contact"
        assert_equal 2, result.size
        assert result[1].age > age_value
    end

    test "readable where conditions" do
        age_value = 10
        field_name = 'age'

        filter = SegmentationFilter.create(type: "NumberSegmentationFilter", name: "maior que")
        seg = Segmentation.create(name: "by age")
        seg.segmentation_clauses.create(segmentation_filter: filter, segmentation: seg, compare_value: age_value, compare_field: field_name)

        assert_equal "#{field_name} > #{age_value}", seg.readable_conditions
    end

    test "readable where conditions with 2 or more" do
        age_value = 10
        age_value2 = 10+20
        field_name = 'age'

        filter = SegmentationFilter.create(type: "NumberSegmentationFilter", name: "maior que")
        filter2 = SegmentationFilter.create(type: "NumberSegmentationFilter", name: "menor que")
        seg = Segmentation.create(name: "by age")
        seg.segmentation_clauses.create(segmentation_filter: filter, segmentation: seg, compare_value: age_value, compare_field: field_name)
        seg.segmentation_clauses.create(segmentation_filter: filter2, segmentation: seg, compare_value: age_value2, compare_field: field_name)

        assert_equal "#{field_name} > #{age_value} AND #{field_name} < #{age_value2}", seg.readable_conditions
    end
end
