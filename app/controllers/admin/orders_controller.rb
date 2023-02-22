class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])

  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order), notice: "更新に成功しました"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
