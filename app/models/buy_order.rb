class BuyOrder < Order
  attr_accessible :address, :email, :name, :rut, :sell_condition, :telephone, :date, :discount, :code, :dispatch
  auto_increment
	def order_discount
		buy_subtotal*discount/100
	end
	
	def subtotal_after_discount
		buy_subtotal - order_discount
	end

	def tax
		(subtotal_after_discount*0.19).round
	end

	def total
		subtotal_after_discount+tax
	end
end