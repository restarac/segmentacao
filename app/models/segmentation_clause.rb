class SegmentationClause < ApplicationRecord

    belongs_to :segmentation, foreign_key: "segmentation_id"
    belongs_to :segmentation_filter, foreign_key: "segmentation_filter_id"

    def mount_where
        segmentation_filter.with compare_field
    end
end
    