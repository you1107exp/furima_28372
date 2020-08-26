class AddressesController < ApplicationController
  def index
  end

  def new
    @address = PurchaseAddress.new
  end

  def create
    @address = PurchaseAddress.create(address_params)
    if @address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number)
  end
end
