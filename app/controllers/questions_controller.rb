class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]
  
  def index
    @categories = Question.categories

    if params[:tag]
      @questions = Question.available(current_user).tagged_with(params[:tag])
    elsif params[:filter]
      @questions = Question.available(current_user).where(category:params[:filter])
    else
      @questions = Question.available(current_user)
    end
  end

  def new
    @question = Question.new
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
    @answer = Answer.new
    @questions = Question.find(params[:id])
  end

  private

  helper_method :current_question
  def current_question
    @current_question ||= Question.find(params[:id])
  end

  def questions_params
    params.require(:question).permit(:description, :correct_answer, :category, :tag_list, :user_id)
  end

end
