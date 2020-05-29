class QuestionsController < ApplicationController
    before_action :authenticate_user!
  
  def index
    @question = Question.order("RANDOM()").first
  end

  def new
    @question = Question.new
  end

  def create
    Question.create(questions_params)
    redirect_to new_question_path
  end

  def show
    # @question = Question.find(params[:id])
  end

  private

  def questions_params
    params.require(:question).permit(:description, :answer, :bad_answer_one, :bad_answer_two, :category)
  end
end
