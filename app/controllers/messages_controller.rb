class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    if @message.save
      Broadcast::Message.append(message: @message)
    end

    respond_to do |format|
      format.html { redirect_to messages_path }
      format.turbo_stream
    end
  end

  private

  def message_params
    logger.debug "Message attributes hash: #{params}"
    params.require(:message).permit(:body)
  end
end
