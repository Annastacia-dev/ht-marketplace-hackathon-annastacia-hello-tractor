class SellersController < ApplicationController
  def index
    @sellers = User.where(role: :seller)
  end
end