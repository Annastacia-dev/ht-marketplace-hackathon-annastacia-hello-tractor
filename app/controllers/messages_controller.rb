class MessagesController < ApplicationController
  def new
    @tractor = Tractor.find(params[:id]) # Adjust as needed for your model
    @notification = Notification.new
    @image = @tractor.images.first if @tractor.images.any? # Assuming Tractor has_many :images
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      redirect_to some_path, notice: 'Message sent successfully.'
    else
      render :new, alert: 'Failed to send the message.'
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:subject, :message, :link, :link_text, :user_id)
  end
end
