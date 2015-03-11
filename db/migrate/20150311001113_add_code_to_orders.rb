class AddCodeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :code, :integer, unique: true
  end
end
