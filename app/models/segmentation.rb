class Segmentation < ApplicationRecord
    has_many :segmentation_clause

    def search! activerecord_class
        result = activerecord_class.constantize
        segmentation_clause.each { |comp| result = result.where(comp.mount_where, comp.compare_value)}
        return result
    end
end
