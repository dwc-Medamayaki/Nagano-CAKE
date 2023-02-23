class Public::AddressesController < ApplicationController
   before_action :set_address, only: [:edit, :update, :destroy]
  
  
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
  end
  
  def update
    if @address.update(address_params)
      redirect_to addresses_path, notice: "変更に成功しました"
    else
      render :edit
    end
  end
  
  def destroy
     @address.destroy
    redirect_to addresses_path
  end
  
  private
  
  def set_address
    @address = Address.find(params[:id])
  end
  
  def address_params
    params.require(:address).permit(:customer_id,:post_code,:location,:name) 
  end
  
end
