class AddDispatchToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :dispatch, :string
  end
end
