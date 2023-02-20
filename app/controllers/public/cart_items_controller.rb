class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total = 0

  end

  def create
    @cart_items = CartItem.where(customer_id: current_customer)
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.quantity == nil
      redirect_to cart_items_path, notice: "商品を追加に失敗しました" 
    else
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
          redirect_to root_path, notice: "商品の追加に失敗しました"
        end
      end
    end 
  end

  def update
    @cart_item = CartItem.find(params[:id]) 
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path, notice: "You have update item successfully."
    else
      render "index"
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id]) 
    if @cart_item.destroy
    redirect_to cart_items_path
    else
      render "index"
    end
  end

  def destroy_all
    if CartItem.where(customer_id: current_customer).destroy_all
    redirect_to cart_items_path
    else
      render "index"
    end
  end
  
  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :quantity)
  end
 
end