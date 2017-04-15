class StoresController < ApplicationController
  def index
    @stores = Store.get_stores_by_zip(params[:search])
  end

  def show

  end
end
