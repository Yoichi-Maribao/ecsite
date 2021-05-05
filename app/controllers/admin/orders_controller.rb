class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @orders = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    if params[:order][:status] == "paid"
      @order.order_details.map{|order_detail| order_detail.update(status: 1 ) }
    end
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

end
