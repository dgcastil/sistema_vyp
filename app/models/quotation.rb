class Quotation < Order
attr_accessible :code
	def subtotal
    	order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.sell_price) : 0 }.sum
	end

private
	
	def update_subtotal
    	self[:subtotal] = subtotal
	end

end
