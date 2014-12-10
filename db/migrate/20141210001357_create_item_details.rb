class CreateItemDetails < ActiveRecord::Migration
  def change
    create_table :item_details do |t|
      t.string :description
      t.integer :item_id
      t.integer :job_id

      t.timestamps
    end
  end
end
