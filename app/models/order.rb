class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :rut, :sell_condition, :subtotal, :telephone, :date, :discount, :code, :dispatch
  has_many :order_items, dependent: :destroy
  after_initialize :init
  
					
	def init
	      self.discount  ||= 0.0 
	      self.date ||= Date.current()          
	end

	def sell_subtotal
	    	order_items.collect { |oi| oi.valid? ? (oi.sell_total) : 0 }.sum
	end

	def buy_subtotal
	      order_items.collect { |oi| oi.valid? ? (oi.buy_total) : 0 }.sum
	end

	def order_discount
		sell_subtotal*discount/100
	end

	def subtotal_after_discount
		sell_subtotal - order_discount
	end

	def tax
		(subtotal_after_discount*0.19).round
	end

	def total
		subtotal_after_discount+tax
	end

end
