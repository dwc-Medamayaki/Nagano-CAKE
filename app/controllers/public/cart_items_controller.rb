class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total = 0

  end

  def create
    @cart_items = CartItem.where(customer_id: current_customer)
    @cart_item = CartItem.new(cart_item_params)
    if @cart_items.exists?(item_id: @cart_item.item_id)
      @was_cart_item = CartItem.new
      @was_cart_item = @cart_items.find_by(item_id: @cart_item.item_id)
      @was_cart_item.quantity += @cart_item.quantity
      @was_cart_item.save
      redirect_to cart_items_path, notice: "商品を追加しました"
    else
      if @cart_item.save
        redirect_to cart_items_path, notice: "商品を追加しました"
      else
        redirect_to root_path, notice: "商品を追加に失敗しました"
      end
    end
  end

  def destroy_all
  end
  
  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :quantity)
  end
 
end
