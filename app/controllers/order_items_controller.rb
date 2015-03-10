class OrderItemsController < ApplicationController
  before_filter :signed_in_user
  def new
  @order = current_order
  @order_item = @order.order_items.new
  end


  def create
    
    @order = current_order
   # @order_item = @order.order_items.new(:quantity => params[:order_item][:quantity],:product_id => params[:order_item][:product_id])
    @order_item = @order.order_items.new(order_item_params)
    
    
    
    
    respond_to do |format|
      if @order.save
        format.html {redirect_to orders_path, notice: "Item ingresado"}
        format.js {}
        session[:order_id] = @order.id
        #format.json { render json: @order, status: :created, location: @order }
      else
        format.html { redirect_to orders_path, notice: "Error #{@order.errors}" }
        #format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
      
         
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items

     respond_to do |format|
      if @order.save
        format.html {redirect_to orders_path, notice: "Item modificado"}
        format.js {}
       
        #format.json { render json: @order, status: :created, location: @order }
      else
        format.html { redirect_to orders_path, notice: "Error #{@order.errors}" }
        #format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
  private
    def order_item_params
      params.require(:order_item).permit(:quantity, :product_id)
    end
    def signed_in_user
        unless signed_in?
        store_location
        redirect_to signin_path, notice: "Por favor, ingrese sus credenciales" 
    end
  end
end
