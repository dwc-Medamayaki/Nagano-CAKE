class Admin::OrdersController < ApplicationController
  def show
  end
  
  def customer_index
    @customer = Customer.find(params[:customer_id])
    @orders = Order.where(customer_id: params[:customer_id])
    @orders = @orders.page(params[:page]).per(10)
  end
  
end
