class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(update_params)
      redirect_to admin_order_path(@order_item.order_id), notice: "更新に成功しました"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def update_params
    params.require(:order_item).permit(:production_status)
  end
end
