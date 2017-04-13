class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
end
