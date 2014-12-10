class AddItemDetailIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :item_detail_id, :integer
  end
end
