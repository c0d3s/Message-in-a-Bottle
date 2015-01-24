class MessagesController < ApplicationController
  def new
    @sender = current_user
    @message = Message.new
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

  private
    def message_params
      params.require(:message).permit(:content, :sender_id)
    end

    def new_receiver
      num_users = User.all.length
      User.find(rand(num_users + 1))
    end
end
