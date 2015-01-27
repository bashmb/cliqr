class QuestionsController < ApplicationController
  def create
	  Question.create(question_params)
	  redirect_to "questions"
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
    @question = Question.find(params[:id])
    @questionContent = @question['content']
    @questionUpvotes = @question['upvote']
    @questionDownvotes = @question['downvote']

    
    @answer = Answer.find_by question_id:15
    @answerContent = @answer['content']
    @answerUpvotes = @answer['upvote']
    @answerDownvotes = @answer['downvote']
  end

  def update
  end

  private
  def question_params
	  params.require(:question).permit(:content, :upvote, :downvote)
  end
end
