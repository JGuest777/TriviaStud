class QuestionsController < ApplicationController
    before_action :authenticate_user!
  
  def index
    if params[:tag]
      @question = Question.tagged_with(params[:tag])
    else
      @question = Question.all
    end

    @question = Question.order("RANDOM()").first
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(questions_params)
    if @question.invalid?
      flash[:error] = '<strong>Could not save!</strong> the data you entered is invalid. Please fill out all required.'
    end
    redirect_to new_question_path
  end

  def show
    # @question = Question.find(params[:id])
  end

  private

  def questions_params
    params.require(:question).permit(:description, :answer, :bad_answer_one, :bad_answer_two, :category, :tag_list)
  end
end
