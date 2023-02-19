class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to request.referer
   
  end

  def edit
  end
  
  
  private
  
  def address_params
      params.require(:address).permit(:customer_id,:post_code,:location,:name) 
  end
  
#
  
end
