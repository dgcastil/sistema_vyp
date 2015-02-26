class CartsController < ApplicationController
    

	def new
		

	end
	def show
    	@order_items = current_order.order_items
	end


end
