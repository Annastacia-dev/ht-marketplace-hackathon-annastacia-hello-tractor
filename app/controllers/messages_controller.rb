class MessagesController < ApplicationController

  before_action :find_message, only: [:show]

  def index
    @messages = Message
                  .where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
                  .includes(:message_responses)
                  .order(updated_at: :desc)
  end

  def new
    message = Message.where(sender_id: params[:sender], receiver_id: params[:receiver])

    respond_to do |format|
      if message
          format.html { redirect_to message_path(message) }
      else
        format.html { redirect_to new_message_path }
      end
    end
  end

  def new
    @message = Message.new
  end

  def create
    message = Message.create(message_params)

    respond_to do |format|
      if message.save
          format.html { redirect_to message_path(message) }
      else
        byebug
        format.html { render :new, status: :unprocessable_entity }
      end
    end

  end

  private

  def message_params
    params.permit(:content, :receiver_id, :sender_id, :item_id, :item_type)
  end

  def find_message
    @message = Message.find(params[:id])
  end
end
