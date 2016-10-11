class Segmentation < ApplicationRecord
    validates :name, presence: :true
    
    has_many :segmentation_clauses, dependent: :destroy

    def readable_conditions
        segmentation_clauses.map{ |clause| clause.unsecure_where }.join " AND "
    end

    def search! activerecord_class
        result = activerecord_class.constantize
        segmentation_clauses.each { |comp| result = result.where(comp.mount_where, comp.formated_value)}
        return result
    end
end
