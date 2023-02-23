class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    is_complete = true
    if @order_item.update(update_params)
      @order.update(status: "cooking") if @order_item.production_status == "cooking"
      @order.order_items.each do |order_item|
        is_complete = false if order_item.production_status != "finished"
      end
        @order.update(status: "preparing") if is_complete
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