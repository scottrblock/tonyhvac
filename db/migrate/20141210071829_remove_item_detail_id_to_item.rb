class RemoveItemDetailIdToItem < ActiveRecord::Migration
  def change
    remove_column :items, :item_detail_id, :integer
  end
end
