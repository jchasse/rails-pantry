class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.create(item_params(:name))
    redirect_to item_path(item)
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
    item = Item.find_by(id: params[:id])
    item.update(item_params(:name))
    redirect_to item_path(item)
  end

  def destroy
    item = Item.find_by(id: params[:id])
    item.destroy
    redirect_to items_path
  end

  private

  def item_params(*args)
    params.require(:item).permit(args)
  end


end
