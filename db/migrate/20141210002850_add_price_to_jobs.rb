class AddPriceToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :price, :decimal
  end
end
