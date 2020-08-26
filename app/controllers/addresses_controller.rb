class AddressesController < ApplicationController
  def index
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number)
  end
end
