class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end

  def marketplace
    @tractors = Tractor.all
  end
end
