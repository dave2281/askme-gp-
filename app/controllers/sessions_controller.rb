class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])

    if @user.present?
      session[:user_id] = @user.id 
      redirect_to root_url, notice: 'Success!'
    else
      flash.now.alert = 'Incorrect pass or email'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil 
    redirect_to root_url, notice: 'You just logged out! Come back.'
  end
end
