class RemoveQuantityFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :quantity, :integer
  end
end
