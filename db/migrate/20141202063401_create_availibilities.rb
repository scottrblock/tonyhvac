class CreateAvailibilities < ActiveRecord::Migration
  def change
    create_table :availibilities do |t|
      t.integer :contractor_id
      t.string :day
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
