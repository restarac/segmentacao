class CreateSegmentationFilters < ActiveRecord::Migration[5.0]
  def change
    create_table :segmentation_filters do |t|
      t.string :type
      t.string :name
      t.index :type

      t.timestamps
    end
  end
end
