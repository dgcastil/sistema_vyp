class CartsController < ApplicationController
    before_filter :signed_in_user

	def new
		@products = Product.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
		@order_items=current_order.order_items
	end

private

  def signed_in_user
      unless signed_in?
      store_location
      redirect_to signin_path, notice: "Por favor, ingrese sus credenciales" 
  end
end

end
