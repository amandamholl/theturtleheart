class StoreController < ApplicationController
  def index
      @items=Product.all
  end
end
