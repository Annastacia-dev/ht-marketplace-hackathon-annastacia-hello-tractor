class MessageResponsesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_message

  def create
    @response = @message.message_responses.new(message_response_params)
    @response.user = current_user


    if @response.save
      respond_to do |format|
        format.html { redirect_to @response.message, notice: 'Message sent!' }
      end
    else
      respond_to do |format|
        format.html { redirect_to @response.message, alert: 'Could not send message.' }
      end
    end
  end

  private

  def message_response_params
    params.permit(:content, :message_id)
  end

  def find_message
    @message = Message.find(params[:message_id])
  end
end
