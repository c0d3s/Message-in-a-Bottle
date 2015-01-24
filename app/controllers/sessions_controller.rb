class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_handle(user_params[:handle])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), :notice => "Welcome, #{@user.handle}"
    else
      flash.now.alert = "Incorrect username or password."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  private
    def user_params
      params.require(:user).permit(:handle, :password)
    end
end
