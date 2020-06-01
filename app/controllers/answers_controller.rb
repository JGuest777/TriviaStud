class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @question.answers.create(answer_params.merge(user: current_user))
    redirect_to question_path(@question)
  end

    private

  def answer_params
    params.require(:answer).permit(:submitted_answer)
  end
end
