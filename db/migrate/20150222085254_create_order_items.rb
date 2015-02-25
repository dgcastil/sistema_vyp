class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.string :product_references
      t.references :order
      t.integer :unit_price
      t.integer :quantity

      t.timestamps
    end
    add_index :order_items, :order_id
  end
end
