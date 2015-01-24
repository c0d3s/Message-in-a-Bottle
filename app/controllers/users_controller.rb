class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sessions[:user_id] = @user.id
      redirect_to messages_path, notice: "Signed Up"
    else
      render 'new'
    end
  end

  def show
    @user = current_user
  end

  private
    def user_params
      params.require(:user).permit(:handle, :password)
    end
end
