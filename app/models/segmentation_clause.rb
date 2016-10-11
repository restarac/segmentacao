class SegmentationClause < ApplicationRecord
    validates :compare_value, :compare_field, :segmentation, :segmentation_filter, presence: true

    belongs_to :segmentation, foreign_key: "segmentation_id"
    belongs_to :segmentation_filter, foreign_key: "segmentation_filter_id"

    def segmentation_name
        segmentation.name
    end

    def formated_value
        segmentation_filter.treat_value compare_value
    end

    def unsecure_where
        mount_where.gsub! '?', formated_value
    end

    def readable_where
        "#{compare_field} #{segmentation_filter.name} #{compare_value}"
    end

    def mount_where
        segmentation_filter.mount_condition compare_field
    end
end
    