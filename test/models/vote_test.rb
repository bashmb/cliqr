require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  setup do
    # a test user
    @user = User.new
    @user.email = "testerino@test.com"
    @user.password = "abcd1234"
    @user.presenter = false
    @user.save

    # a test question
    #@user.questions.create text: "This is a test qustion?"
  end

  test "should create a question up vote" do
    puts "user ", @user
    q = @user.questions.new
    q.text = "This is a test question?"
    q.save
    puts "question", q.id, q.text
    # @user.questions.new(text: "This is a test question?").save
    # puts "user questions", @user.questions.find_by(id: 1).text
    @user.questions.find_by(id: 1).votes.create content_type: "Question", vote_type: "upvote"
    
    puts "user votes", @user.questions
  end
end
