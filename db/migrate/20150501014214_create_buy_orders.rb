class CreateBuyOrders < ActiveRecord::Migration
  def change
    create_table :buy_orders do |t|
      t.string :address
      t.string :rut
      t.string :name
      t.date :date
      t.integer :discount
      t.string :telephone
      t.string :sell_condition
      t.string :dispatch
      t.string :email

      t.timestamps
    end
  end
end
