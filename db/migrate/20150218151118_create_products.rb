class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :code
      t.string :name
      t.integer :buy_price
      t.integer :sell_price

      t.timestamps
    end
    add_index :products, :code, unique: true
  end
end
