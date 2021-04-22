class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @user = current_end_user
    @current_address = {"address" => "〒#{@user.postcode} #{@user.address} ", "name" => "#{@user.last_name + @user.first_name}"}
  end

  def confirm
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    if  params[:order][:address_option] == "0"
      @order.postcode = current_end_user.postcode
      @order.address = current_end_user.address
      @order.name = current_end_user.last_name + current_end_user.first_name
    elsif params[:order][:address_option] == "1"
      selected_address = Address.find(params[:order][:id])
      @order.postcode = selected_address.postcode
      @order.address = selected_address.address
      @order.name = selected_address.name
    end
    if @order.invalid?
      @user = current_end_user
      @current_address = {"address" => "〒#{@user.postcode} #{@user.address} ", "name" => "#{@user.last_name + @user.first_name}"}
      render :new
    end
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_thanks_path
  end

  def thanks
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:postcode, :address, :name, :payment_method, :total_payment, :end_user_id)
  end

end
