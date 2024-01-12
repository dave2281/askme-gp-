class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'John',
      email: 'john@gmail.com',
      username: '@johnyboy'
    )
  end
end
