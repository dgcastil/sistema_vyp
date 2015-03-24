class Order < ActiveRecord::Base
  attr_accessible :code, :address, :email, :name, :rut, :sell_condition, :subtotal, :telephone
  has_many :order_items, dependent: :destroy
  
 
def sell_subtotal
    	order_items.collect { |oi| oi.valid? ? (oi.sell_total) : 0 }.sum
end
def buy_subtotal
    	order_items.collect { |oi| oi.valid? ? (oi.buy_total) : 0 }.sum
end

end
