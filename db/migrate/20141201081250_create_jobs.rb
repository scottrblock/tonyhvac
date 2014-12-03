class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :jobTitle
      t.text :jobDescription
      t.string :jobType
      t.decimal :jobCost
      t.decimal :jobQuotedPrice
      t.boolean :jobUrgency

      t.timestamps
    end
  end
end
