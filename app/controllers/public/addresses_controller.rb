class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.where(customer_id: current_customer)
    
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to request.referer
   
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path, notice: "変更に成功しました"
    else
      render :edit
    end
  end
  
  private
  
  def address_params
      params.require(:address).permit(:customer_id,:post_code,:location,:name) 
  end
  
#
  
end
