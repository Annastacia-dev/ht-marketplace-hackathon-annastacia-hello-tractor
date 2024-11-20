class TractorsController < ApplicationController
  before_action :set_tractor_listing
  before_action :set_tractor, only: [:show, :edit, :update, :destroy]

  def new
    @tractor = @tractor_listing.tractors.build
  end

  def create

    @tractor = @tractor_listing.tractors.create(tractor_params)

    respond_to do |format|
      if @tractor.save
          format.html { redirect_to tractor_listing_path(@tractor_listing), notice: "Tractor was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
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

  def tractor_params
    params.require(:tractor).permit([:brand, :model, :description, :condition, :year_of_manufacture, :hours_used, :location, :price, :publishing_status, :selling_status, :images])
  end
end
