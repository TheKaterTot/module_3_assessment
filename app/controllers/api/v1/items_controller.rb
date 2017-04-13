class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      render :show, status: 201
    else
      head 400
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    head 204
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
