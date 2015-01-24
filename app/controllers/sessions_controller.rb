class SessionsController < ApplicationController
  def create
    @user = User.find_by_handle(params[:handle])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to welcome_path, :notice => "Welcome, #{@user.handle}"
    else
      flash.now.alert = "Incorrect username or password."
      render 'new'
    end
  end
end
