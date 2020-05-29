class QuestionsController < ApplicationController
    before_action :authenticate_user!, only: [:index]
  
  def index

    @question = Question.order("RANDOM()").first
    
  end

  def new
    
  end

  private

  def questions_params
    params.require(:question).permit(:description, :answer)
  end
end
