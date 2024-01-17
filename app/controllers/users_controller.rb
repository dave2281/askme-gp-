class UsersController < ApplicationController
  def index
    @users = [
      User.new(
      id: 1,
      name: 'John',
      email: 'john@gmail.com',
      username: '@johnyboy',
      avatar_url: 'https://gravatar.com/avatar/f449c85576a6478bcec3a38e2072e12a?s=400&d=mp&r=x'),
      
      User.new(
      id: 2,
      name: 'Mike',
      email: 'mike@gmail.com',
      username: '@mikeboy',
      avatar_url: 'https://gravatar.com/avatar/f449c85576a6478bcec3a38e2072e12a?s=400&d=mp&r=x')
  
  ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      id: 1,
      name: 'John',
      email: 'john@gmail.com',
      username: '@johnyboy',
      avatar_url: 'https://gravatar.com/avatar/f449c85576a6478bcec3a38e2072e12a?s=400&d=mp&r=x')

    @questions = [
      Question.new(text: 'How are you?', created_at: Date.parse('20.02.1922')),
      Question.new(text: 'Fine!', created_at: Date.parse('20.02.1943'))
    ]

    @new_question = Question.new
  end
end
