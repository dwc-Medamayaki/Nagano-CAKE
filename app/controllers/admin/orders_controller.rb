class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total = 0
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order), notice: "更新に成功しました"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def customer_index
    @customer = Customer.find(params[:customer_id])
    @orders = Order.where(customer_id: params[:customer_id])
    @orders = @orders.page(params[:page]).per(10)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
  

  
end
