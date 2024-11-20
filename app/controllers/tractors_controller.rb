class TractorsController < ApplicationController
  before_action :set_tractor_listing
  before_action :set_tractor, only: [:show, :edit, :update, :destroy]

  def new
    @tractor = @tractor_listing.tractors.build
  end

  def create
    @tractor = @tractor_listing.tractors.build(tractor_params)
    if @tractor.save
      redirect_to tractor_listing_path(@tractor_listing), notice: 'Tractor was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_tractor_listing
    @tractor_listing = TractorListing.find(params[:tractor_listing_id])
  end
end
