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
		raise "Not defined for #{self.class}"
	end

	def subtotal_after_discount
		raise "Not defined for #{self.class}"
	end

	def tax
		raise "Not defined for #{self.class}"
	end

	def total
		raise "Not defined for #{self.class}"
	end

end
