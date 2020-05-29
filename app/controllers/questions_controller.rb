class QuestionsController < ApplicationController
    before_action :authenticate_user!, only: [:index]
  
  def index
    @trivia = Trivium.all
  end

  def new
    
  end
end
