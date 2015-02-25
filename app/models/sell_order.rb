class SellOrder < Order

	def subtotal
    	order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.buy_price) : 0 }.sum
	end

private
	
	def update_subtotal
    	self[:subtotal] = subtotal
	end

end
