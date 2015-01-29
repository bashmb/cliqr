require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  setup do
    # a test user
    @user = User.new
    @user.email = "testerino@test.com"
    @user.password = "abcd1234"
    @user.presenter = false
    @user.save
  end

  teardown do
    @user = nil
  end

  test "should create a question up vote" do
    puts "user ", @user
    q = @user.questions.new
    q.text = "This is a test question?"
    q.save
    puts "question", q.id, q.text
    # @user.questions.new(text: "This is a test question?").save
    # puts "user questions", @user.questions.find_by(id: 1).text
    @user.questions.first.votes.create content_type: "Question", vote_type: "upvote"
    
    puts "user votes", @user.questions.count, 
        @user.questions.first.votes.first.content_type,
        @user.questions.first.votes.first.vote_type,
        @user.questions.first.votes.first.id,
        @user.questions.first.votes.first.user_id


  end
end
