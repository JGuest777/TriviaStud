class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @question.answers.create(answer_params.merge(user: current_user))
    redirect_to new_question_answer_path
  end

  def new
    @question = Question.find(params[:question_id])
    # @answer = Answer.new
    @user_answer = Answer.find(params[:question_id])
  end

    private

  def answer_params
    params.require(:answer).permit(:submitted_answer, :user_id, :question_id)
  end
end
