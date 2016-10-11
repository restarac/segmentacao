class Segmentation < ApplicationRecord
    validates :compare_value, presence: :true
    
    has_many :segmentation_clause, dependent: :destroy

    def conditions
        segmentation_clause.map{ |clause| clause.unsecure_where }.join " | "
    end

    def search! activerecord_class
        result = activerecord_class.constantize
        segmentation_clause.each { |comp| result = result.where(comp.mount_where, comp.compare_value)}
        return result
    end
end
