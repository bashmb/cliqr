require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "should not save question without text" do
    question = Question.new
    assert_not question.save, "Saved the question without text"
  end

  test "should not save question without a user_id" do
    question = Question.new
    question.text = "This is a test question"
    assert_not question.save, "Saved the question without a user_id"
  end

  test "should save a question" do
    question = Question.new
    question.text = "This is a test question"
    question.user_id = 1
    assert question.save, "Saved the question"
  end
end
