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
    @question = @user.questions.new
    @question.text = "This is a test question?"
    @question.save
  end

  teardown do
    @user = nil
  end

  test "should create a question" do
    @vote = @question.votes.new 
    @vote.content_type = "Question"
    @vote.vote_type = "upvote"
    @vote.save
    ctype = @vote.content_type

    assert_equal "Question", ctype, "Content type is not 'Question'"
  end
end
