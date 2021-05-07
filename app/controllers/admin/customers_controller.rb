class Admin::CustomersController < ApplicationController
  def index
    @users = EndUser.all
  end

  def show
    @user = EndUser.find(params[:id])
  end

  def edit
    @user = EndUser.find(params[:id])
  end

  def update
    @user = EndUser.find(params[:id])
    if @user.update(end_user_params)
      redirect_to admin_customer_path(@user.id)
    else
      render :show
    end
  end

  private
  def end_user_params
    params.require(:end_user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postcode, :address, :phone_number, :email, :is_active)
  end

end
