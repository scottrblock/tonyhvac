class AddIndexToJobs < ActiveRecord::Migration
  def self.up
    add_index :jobs, :customer_id
  end

  def self.down
    remove_index :jobs, :customer_id
  end
end
