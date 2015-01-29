require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  def setup
    @user = User.new
    @user.email = "testerino@test.com"
    @user.password = "abcd1234"
    @user.presenter = false
    @user.save
  end

  def teardown
    @user = nil
  end

  test "should create a question up vote" do
    @user.questions.create text: "This is a test question?"
    @user.questions.find_by(id: 1).votes.create content_type: "Question", vote_type: "upvote"
    puts "user questions", @user.questions
    puts "user votes", @user.questions.votes
  end
end