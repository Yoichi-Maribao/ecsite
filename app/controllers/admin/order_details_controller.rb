class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])

    if params[:order_detail][:status] == "production"
      @order_detail.order.update(status: 2)
    end

    @order_detail.update(order_detail_params)

    if @order_detail.order.order_details.where(status: 3).count == @order_detail.order.order_details.count
      @order_detail.order.update(status: 3)
    end

    redirect_to admin_order_path(@order_detail.order_id)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:status)
  end

end
