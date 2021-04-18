class Public::CustomersController < ApplicationController
  before_action :authenticate_end_user!, :check_login
  def show
    @user = current_end_user
  end

  def edit
  end

  def update
    @user = current_end_user
    @user.update(end_user_params)
    redirect_to customers_mypage_path
  end

  def unsubscribe
  end

  def withdraw
    @user = current_end_user
    @user.update(is_active: false)
    redirect_to logout_path
  end

  private
  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :postcode, :address, :phone_number)
  end

  def check_login
    redirect_to logout_path if current_end_user.is_active != true
  end
end
