class UsersController < ApplicationController

  before_action :load_user, except: [:index, :create, :new]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url, notice: 'Success, user was registered!'
    else 
      render 'new'
    end
  end
  
  def update
    if @user.update(user_params)
      redirect_to users_path(@user), notice: 'Success, data was updated!'
    else 
      render 'edit'
    end
  end
  

  def edit
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions.order(created_at: :desc)

    @new_question = @user.questions.build
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :username, :avatar_url )
  end

  def load_user
    @user ||= User.find(params[:id])
  end

end
