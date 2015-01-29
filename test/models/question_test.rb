require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

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

  test "should not save question with empty text" do
    assert_raises(ActiveRecord::RecordInvalid, "Saved the question without text") { @user.questions.create!(text: "")}
  end

  test "should save a question" do
    assert @user.questions.create(text: "This is a test question?"), "Saved the question"
  end

end
