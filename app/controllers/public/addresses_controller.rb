class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
    @submit = "新規登録"
  end

  def edit
    @address = Address.find(params[:id])
    @submit = "変更内容を保存"
  end


  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    @address.save
    redirect_to addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:postcode, :address, :name)
  end

end
