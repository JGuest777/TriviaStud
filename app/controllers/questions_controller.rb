class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]
  
  def index
    
    @categories = Question.categories

      if params[:tag]
        @questions = Question.available(current_user.id).tagged_with(params[:tag])
      elsif params[:filter]
        @questions = Question.available(current_user.id).where(category:params[:filter])
      else
        if !current_user.nil?
          @questions = Question.available(current_user.id) 
        else
          @questions = Question.all
        end
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

  def questions_params
    params.require(:question).permit(:description, :answer, :category, :tag_list, :user_id)
  end

end
