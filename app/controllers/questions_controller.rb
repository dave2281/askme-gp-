class QuestionsController < ApplicationController
  before_action :load_question, only: %i[ show edit update destroy ]
  before_action :authorize_user, except: [:create]

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    if @question.save 
      redirect_to users_path(@question.user), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    if @question.update(question_params)
      redirect_to users_path(@question.user), notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    user = @question.user
    @question.destroy

    redirect_to users_path(user), notice: 'Question was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_question
      @question = Question.find(params[:id])
    end

    def authorize_user
      reject_user unless @question.user == current_user
    end

    # Only allow a list of trusted parameters through.
    def question_params
      if current_user.present? && params[:question][:user_id].to_i == current_user.id
        params.require(:question).permit(:user_id, :text, :answer)
      else
        params.require(:question).permit(:user_id, :text)
      end
    end
end