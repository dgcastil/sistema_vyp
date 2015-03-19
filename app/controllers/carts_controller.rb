class CartsController < ApplicationController
    

    before_filter :signed_in_user

	def new
  
		@products = Product.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
		@order=current_order
    @order_items=current_order.order_items

	end

  def new_sell_order
    @order=current_order

  end

  def new_quotation
    @quotation=Quotation.new
  end
  def create_sell_order
    @order=current_order


  end

  def create_quotation
    @order=current_order
    @quotation = Quotation.new(params[:quotation])
    @quotation.order_items=@order.order_items
    current_order.destroy


    if @quotation.save

      #flash[:success] = "Cotización generada"
      session[:order_id]=nil
      #redirect_to pdf_path @quotation

      render 'pdf/new'
    else
      redirect_to quotation_path
    end
  end

  private
    
    def signed_in_user
        unless signed_in?
        store_location
        redirect_to signin_path, notice: "Por favor, ingrese sus credenciales" 
    end
  end

end
