class QuestionsController < ApplicationController
  # include Votable

  # before_filter :load_content

  def create
    puts question_params
    question = Question.create(question_params)
    redirect_to question_path(question)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def index
    puts "in index"
    @questions = Question.all.order('upvote - downvote DESC')

    @user = User.find(current_user.id)

    @answers = Answer.all.order('upvote - downvote DESC')

    @vote = Vote.new

  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order('upvote - downvote DESC')
    @answerCurrentScore = @question.answers[0].upvote if @question.answers.length > 0
    @answer = @question.answers.new
    @vote = @question.votes.new
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to question_path(@question)
  end

  def latest
    @latest = Question.where(timestamp: 1.second.ago).count
    render :json => @latest
  end

  private
  def question_params
    params.require(:question).permit(:text, :upvote, :downvote, :user_id)
  end
end
