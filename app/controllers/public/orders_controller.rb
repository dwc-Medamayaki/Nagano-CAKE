class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def confirm
    @order = Order.new
    @cart_items = current_customer.cart_items

    @order.pay_method = params[:order][:pay_method]
    if params[:order][:address_option] == "0"
      @order.send_post_code = current_customer.post_code
      @order.send_address = current_customer.address
      @order.send_name ~ current_customer.full_name

    elsif params[:order][:address_option] == "1"
      @selected_address = params[:order][:registered_address]#.to_i
      @order_address = Address.find(@selected_addres)
      @order.send_post_code = @order_address.post_code
      @order.send_address = @order_address.location
      @order.send_name = @order_address.name

    elsif params[:order][:address_option] == "2"
      @order.send_post_code = params[:order][:postal_code]
      @order.send_address = params[:order][:send_address]
      @order.send_name = params[:order][:send_name]
    end
    
  end


  def create
  end

  def index
  end

  def show
  end
  
end

