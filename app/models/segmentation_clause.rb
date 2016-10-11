class SegmentationClause < ApplicationRecord
    validates :compare_value, :compare_field, :segmentation, :segmentation_filter, presence: true

    belongs_to :segmentation, foreign_key: "segmentation_id"
    belongs_to :segmentation_filter, foreign_key: "segmentation_filter_id"

    def unsecure_where
        mount_where.gsub! "\?", compare_value
    end

    def mount_where
        segmentation_filter.mount_condition compare_field
    end
end
    