
class ItemsController < ApplicationController
  def index
  @done_items = Item.where(is_done: true)
  @undone_items = Item.where(is_done: false)
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to articles_path
  end
  
end
