class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if current_user&.buyer?
      @tractors = Tractor.all

      @tractors = @tractors.search_by_make_and_model(params[:make]) if params[:make].present?
      @tractors = @tractors.where("model LIKE ?", "%#{params[:model]}%") if params[:model].present?
      @tractors = @tractors.where(price: params[:min_price]..params[:max_price]) if params[:min_price].present? && params[:max_price].present?
      @tractors = @tractors.where(location: params[:location]) if params[:location].present?
      @tractors = @tractors.where("hours_used <= ?", params[:max_hours]) if params[:max_hours].present?


      # Pagination (optional)
      @tractors = @tractors.paginate(page: params[:page], per_page: 20)
    end
  end

  def marketplace
    @tractors = Tractor.all
  end
end
