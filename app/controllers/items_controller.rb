class ItemsController < ApplicationController

  def index
    #@items = Item.all

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
  end

  private

  def delivery_params
    params.require(:item).permit(:fee_id)
  end

  #def item_params
    #params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  #end
end
