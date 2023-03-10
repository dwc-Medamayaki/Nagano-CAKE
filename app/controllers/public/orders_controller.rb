class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
    @order.postage = 800
    @order.total_payment = 0
    @cart_items = current_customer.cart_items.all

    @order.pay_method = params[:order][:pay_method]
    if params[:order][:address_option] == "0"
      @order.send_post_code = current_customer.post_code
      @order.send_address = current_customer.address
      @order.send_name = current_customer.full_name

    elsif params[:order][:address_option] == "1"
      @selected_address = params[:order][:registered_address]
      if @selected_address.empty?
       redirect_to new_order_path 
      else
      @order_address = Address.find(@selected_address)
      @order.send_post_code = @order_address.post_code
      @order.send_address = @order_address.location
      @order.send_name = @order_address.name
      end
    elsif params[:order][:address_option] == "2"
      @order.send_post_code = params[:order][:send_post_code]
      @order.send_address = params[:order][:send_address]
      @order.send_name = params[:order][:send_name]
      redirect_to new_order_path if @order.send_name.empty? || @order.send_post_code.empty? || @order.send_address.empty?
    end

  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_item = @order.order_items.new
        @order_item.item_id = cart_item.item_id
        @order_item.price = cart_item.item.tax_price
        @order_item.quantity = cart_item.quantity
        @order_item.production_status = "cannot_start"
        @order_item.save
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_complete_path
    else
      redirect_to new_order_path
    end
  end

  def complete
  end

  def index
    @orders= current_customer.orders.all
  end

  def show
    @order= Order.find(params[:id])
    @order.postage = 800
    @total_price= @order.order_items
  end

  private

    def order_params
      params.require(:order).permit(:customer_id, :send_post_code, :send_address, :send_name, :status, :total_payment, :pay_method, :postage)
    end

end
