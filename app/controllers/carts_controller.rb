class CartsController < ApplicationController
    

    before_filter :signed_in_user

	def new
  
		@products = Product.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
		@order=current_order
    @order_items=current_order.order_items

	end


  def new_quotation
    @order=current_order
  end
  

  def create_quotation
    @order=current_order
    @order.update_attributes(params[:order])
    if @order.save
          

      render 'pdf/new_quotation'
    else
      redirect_to quotation_path
    end
  end

  def new_buy_order
    @order=current_order
  end
  

  def create_buy_order
      @order=current_order
      @buy_order=BuyOrder.new
      @buy_order.order_items=@order.order_items
      @buy_order.update_attributes(params[:order])
     

    if @buy_order.save
      
      #flash[:success] = "Cotización generada"
    
      #redirect_to pdf_path @quotation

      render 'pdf/new_buy_order'
    else
      redirect_to buy_order_path
    end
  end

end
