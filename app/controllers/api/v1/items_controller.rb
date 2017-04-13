class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end
end
