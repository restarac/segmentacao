class SegmentationFilter < ApplicationRecord
    self.inheritance_column = :type

    def mount_condition field
        specific_filter = get_subclass
        specific_filter.with field if !specific_filter.is_a? SegmentationFilter
    end

    def treat_value value
        specific_filter = get_subclass
        specific_filter.treat_value value if !specific_filter.is_a? SegmentationFilter
    end
    
    private 
        def get_subclass
            type.constantize.new(name: name)
        end
end
