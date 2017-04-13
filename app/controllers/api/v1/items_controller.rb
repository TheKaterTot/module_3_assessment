class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    head 204
  end
end
