class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @list = List.find(params[:item][:list_id])
    @item = @list.items.new(item_params)

    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

private
  def item_params
    params.require(:item).permit(:name, :complete)
  end

end
