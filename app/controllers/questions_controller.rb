class QuestionsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
    @categories = Question.categories

    if params[:tag]
      @questions = Question.available(current_user.id).tagged_with(params[:tag])
    elsif params[:filter]
      @questions = Question.available(current_user.id).where(category:params[:filter])
    else
      @questions = Question.available(current_user.id)
    end

  end

  def new
    @questions = Question.new
  end

  def create
    @question = current_user.questions.create(questions_params)
    if @question.invalid?
      flash[:error] = '<strong>Could not save!</strong> the data you entered is invalid. Please fill out all required.'
    end
    flash[:success] = '<strong>Your Trivia was saved!</strong>'
    redirect_to new_question_path
  end

  def show
    @questions = Question.find(params[:id])

    @answers = [@questions.answer, @questions.bad_answer_one, @questions.bad_answer_two].shuffle!
    
  end

  private

  def questions_params
    params.require(:question).permit(:description, :answer, :bad_answer_one, :bad_answer_two, :category, :tag_list, :user_id)
  end
end
