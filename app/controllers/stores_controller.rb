class StoresController < ApplicationController
  def index
    @stores = BbService.find_stores_by_zip(params[:search])
  end

  def show

  end
end
