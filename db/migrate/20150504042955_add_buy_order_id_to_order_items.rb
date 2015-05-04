class AddBuyOrderIdToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :buy_order_id, :integer
    add_index :order_items, :buy_order_id
  end
end
