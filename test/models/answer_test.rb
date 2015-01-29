require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  def setup
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

  def teardown
    @user = nil
  end

  test "should save an answer" do
    @answer = @question.answers.new question_id: @question.id, user_id: @user.id
    assert_not @answer.save, "Saved with answer text nil/empty"
  end
end
