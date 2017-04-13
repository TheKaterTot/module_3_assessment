class StoresController < ApplicationController
  def index
    @stores = BbService.get_stores_by_zip(params[:search])
  end

  def show

  end
end
