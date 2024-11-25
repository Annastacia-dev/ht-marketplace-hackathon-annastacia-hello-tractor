class TractorsController < ApplicationController
  before_action :set_tractor_listing, except: [:index]
  before_action :set_tractor, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user! , only: [:index, :show]

  def index

    @tractors = Tractor.all

    @tractors = @tractors.search_by_make_and_model(params[:make]) if params[:make].present?
    @tractors = @tractors.where("model LIKE ?", "%#{params[:model]}%") if params[:model].present?
    @tractors = @tractors.where(price: params[:min_price]..params[:max_price]) if params[:min_price].present? && params[:max_price].present?
    @tractors = @tractors.where(location: params[:location]) if params[:location].present?
    @tractors = @tractors.where("hours_used <= ?", params[:max_hours]) if params[:max_hours].present?


    # Pagination (optional)
    @tractors = @tractors.paginate(page: params[:page], per_page: 20)
  end

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

  def set_tractor
    @tractor = @tractor_listing.tractors.find(params[:id])
  end

  def tractor_params
    params.require(:tractor).permit([:make, :model, :description, :condition, :year_of_manufacture, :hours_used, :location, :price, :publishing_status, :selling_status, images: []])
  end
end
