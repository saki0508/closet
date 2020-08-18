class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to user_path(@item.user.id)
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_path(@item.user.id)
  end


  private

  def item_params
    params.require(:item).permit(:name, :image).merge(user_id: current_user.id)
  end


end
