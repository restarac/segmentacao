class CreateSegmentationClauses < ActiveRecord::Migration[5.0]
  def change
    create_table :segmentation_clauses do |t|
        t.integer :segmentation_id
        t.integer :segmentation_filter_id
        t.string :compare_field
        t.string :compare_value

        t.timestamps
    end

    add_index :segmentation_clauses, :segmentation_filter_id, name: "seg_filter_clause_on_filter_id_idx"
    add_index :segmentation_clauses, :segmentation_id, name: "seg_filter_clause_on_seg_id_idx"
  end
end
