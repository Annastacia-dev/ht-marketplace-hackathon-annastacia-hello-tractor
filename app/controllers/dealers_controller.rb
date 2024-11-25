class DealersController < ApplicationController
  before_action :set_dealer, only: [:show, :edit, :update, :destroy]

  def index

    @dealers = User.where(role: :dealer)

    @dealers = @dealers.search_by_make(params[:make]) if params[:make].present?
    @dealers = @dealers.where(location: params[:location]) if params[:location].present?
    @dealers = @dealers.paginate(page: params[:page], per_page: 20)
  end

  def new
    @dealer = User.new
  end

  def create

    @dealer = User.create(
      name: params[:name],
      phone: params[:phone],
      location: params[:town],
      email: params[:email] || "#{params[:name].downcase.strip}@email.com",
      role: :dealer,
      dealer_type: :comprehensive,
      password: 'changeme',
      phone_verified_at: Time.now
    )

    respond_to do |format|
      if @dealer.save(validate: false)
         @dealer.locations.create!(
        user: @dealer,
        town: params[:town],
        address: params[:address],
        phone: params[:phone]
        )
        format.html { redirect_to dealers_path, notice: "dealer was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
  end


  def update
    respond_to do |format|
      if @dealer.update(dealer_params)
          format.html { redirect_to dealers_path, notice: "Dealer was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def set_dealer
    @dealer = User.find(params[:id])
  end

  def dealer_params
    params.require(:dealer).permit([:name, :town, :address, :phone])
  end
end
