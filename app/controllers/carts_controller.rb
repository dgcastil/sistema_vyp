class CartsController < ApplicationController
    

	def new
		@products = Product.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
		@order_item = current_order.order_items.new
	end
	def show
    	@order_items = current_order.order_items
	end


end
