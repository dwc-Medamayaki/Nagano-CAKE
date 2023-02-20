class Public::OrdersController < ApplicationController
  def new
  end

  def index
    @orders= Order.all
    
  end

  def show
    @total= 'total_payment'+'postage'
    @item_total= 'price'*'quantity'
  end
end
