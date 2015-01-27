class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Signed Up"
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @new_messages = Message.where(receiver_id: @user.id)
    @sent_messages = Message.where(sender_id: @user.id)
  end

  private
    def user_params
      params.require(:user).permit(:handle, :password, :karma)
    end
end
