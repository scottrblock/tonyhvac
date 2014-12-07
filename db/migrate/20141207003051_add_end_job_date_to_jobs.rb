class AddEndJobDateToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :jobEndDate, :datetime
  end
end