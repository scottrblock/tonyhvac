class AddJobDateToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :job_date, :datetime
  end
end
