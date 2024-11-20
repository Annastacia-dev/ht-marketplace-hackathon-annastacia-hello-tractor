class TractorListingsController < ApplicationController

  before_action :find_tractor_listing, only: :show

  def show
  end

  private

  def find_tractor_listing
    @tractor_listing = current_user.tractor_listing
  end
end
