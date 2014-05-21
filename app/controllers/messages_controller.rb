class MessagesController < ApplicationController
  def index
    if signed_in?()
      @message=Message.new
      @comment=Comment.new
    else
      redirect_to root_path
    end
    @messages = Message.all
  end

  def new
  end

  def create
    message=Message.new(message_params)
    message.save
    @message=Message.new
    @comment=Comment.new
    @messages = Message.all
    
    redirect_to messages_path
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def message_params
    params.require(:message).permit(:message,:user_id)
  end

end
