class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.references :state, foreign_key: true, index: true
      t.string :job

      t.timestamps
    end
  end
end
