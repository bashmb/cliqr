class QuestionsController < ApplicationController
  def create
    puts question_params
	  Question.create(question_params)
	  redirect_to root_path
  end

  def destroy
  end

  def edit
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    question = Question.find(params[:id])
    @content = question['content']
    @upvotes = question['upvote']
    @downvotes = question['downvote']
  end

  def update
  end

  private
  def question_params
	  params.require(:question).permit(:content, :upvote, :downvote)
  end
end
