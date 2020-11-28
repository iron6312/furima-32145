class ItemsController < ApplicationController

  def index
    @items = Item.includes(:user)
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :fee_id, :category_id, :day_to_ship_id, :ship_form_id, :status_id).merge(user_id: current_user.id)
  end

  #def item_params
    #params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  #end
end
