class MessagesController < ApplicationController
  respond_to :html, :js

  def new
    @sender = current_user
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to user_path(current_user)
    else
      flash.now.alert = "Something went wrong. It's probably not your fault."
      render 'new'
    end
    @message.update(receiver_id: new_receiver.id)
  end

  def update
    @message = Message.find(params[:id])
    @sender = User.find(@message.sender_id)
    @message.update(thumbs_up: message_params[:thumbs_up])
    @sender.update_karma(@message)
    Message.destroy(@message.id)
    redirect_to user_path(current_user)
  end

  private
    def message_params
      params.require(:message).permit(:content, :sender_id, :thumbs_up)
    end

    def new_receiver
      num_users = User.all.length
      User.find(rand(num_users + 1))
    end
end
