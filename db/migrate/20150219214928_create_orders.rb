class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :rut
      t.string :address
      t.integer :telephone
      t.string :email
      t.string :sell_condition
      t.integer :subtotal

      t.timestamps
    end
  end
end
