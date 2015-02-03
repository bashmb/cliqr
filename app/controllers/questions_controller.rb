class QuestionsController < ApplicationController
  # include Votable

  # before_filter :load_content

  def create
    Question.create(question_params)
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
    @questions = Question.all.order('vetted DESC, upvote - downvote DESC')

    @user = User.find(current_user.id)

    @answers = Answer.all.order('vetted DESC, upvote - downvote DESC')

    @vote = Vote.new

    categories = []
    data = []
    start_time = Question.first.created_at 
    end_time = Question.last.created_at 
    num_minute_intervals = ((end_time - start_time) / 60).to_i

    num_minute_intervals.times do |minute|
      categories.push(minute)
      data.push(Question.where(:created_at => start_time + minute*60.seconds..start_time + minute*60.seconds + 3.minutes).count) 
    end

    @categories = categories
    @data = data
    {:categoies => categories, :data => data}.as_json

  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order('vetted DESC, upvote - downvote DESC')
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
    @latest = Question.find_by_sql("select * from questions where datetime('now', '-15 seconds') < created_at;").count
    render :json => @latest
  end
  
  def vet
    question = Question.find(params[:id])
    question.update(vetted: true)
    redirect_to question_path(question)
  end

  # def graph
  #   categories = []
  #   data = []
  #   start_time = Question.first.created_at
  #   end_time = Question.last.created_at
  #   num_minute_intervals = ((end_time - start_time) / 60).to_i

  #   num_minute_intervals.times do |minute|
  #     categories.push(minute)
  #     data.push(Question.where(:created_at => start_time + minute*60.seconds..start_time + minute*60.seconds + 3.minutes).count) 
  #   end

  #   {:categoies => categories, :data => data}.as_json
  # end

  private
  def question_params
    params.require(:question).permit(:text, :upvote, :downvote, :user_id)
  end
end


