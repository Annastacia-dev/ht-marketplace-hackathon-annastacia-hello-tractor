class LocationsController < ApplicationController
  before_action :set_user


  def new
    @location = @user.locations.build
  end

  def create
 
    @location = @user.locations.create(location_params)

    respond_to do |format|
      if @location.save
          format.html { redirect_to dealers_path, notice: "location was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
  end


  def update
    respond_to do |format|
      if @location.update(location_params)
          format.html { redirect_to dealers_path, notice: "location was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:location][:user_id])
  end

  def location_params
    params.require(:location).permit([:user, :town, :phone, :address])
  end
end
