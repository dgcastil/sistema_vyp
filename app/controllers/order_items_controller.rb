class OrderItemsController < ApplicationController
  def create
    flash.now[:alert] = "No se pudo "
    @order = current_order
    @order_item = @order.order_items.new(:quantity => params[:order_item][:quantity],:product_id => params[:order_item][:product_id])
    
    respond_to do |format|
      if @order.save
        format.html{redirect_to orders_path}
        format.js
      else
        flash.now[:alert] = "No se pudo guardar"
      end
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
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
end
