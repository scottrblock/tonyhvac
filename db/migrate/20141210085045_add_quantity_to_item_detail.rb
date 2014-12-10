class AddQuantityToItemDetail < ActiveRecord::Migration
  def change
    add_column :item_details, :quantity, :integer
  end
end
