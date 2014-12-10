class RemoveExtrasFromJob < ActiveRecord::Migration
  def change
      remove_column :jobs, :jobCost, :decimal
      remove_column :jobs, :jobQuotedPrice, :decimal
  end
end
