class CartsController < ApplicationController
    

	def new
		find @q

	end
	def show
    	@order_items = current_order.order_items
	end

	def find(var)

		@selected_products=Product.find_by_name(var)
		
	end
	
end
