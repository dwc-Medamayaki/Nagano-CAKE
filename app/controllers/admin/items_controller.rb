class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "登録に成功しました"
      redirect_to admin_item_path(@item)
    else
      render :index
    end
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_sale)
  end

end
