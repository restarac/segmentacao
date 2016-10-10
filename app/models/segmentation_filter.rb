class SegmentationFilter < ApplicationRecord
    self.inheritance_column = :type

    def mount_condition field
        specific_filter = type.constantize.new(name: name)
        specific_filter.with field if !specific_filter.is_a? SegmentationFilter
    end
end
