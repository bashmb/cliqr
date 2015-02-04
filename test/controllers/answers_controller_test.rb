require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  # needed for devise and warden
  include Devise::TestHelpers
  include Warden::Test::Helpers
  # start warden test mode
  Warden.test_mode!

  # *********** Stuff available after a valid request ************
  # puts "assigns", assigns
  # puts "cookies", cookies
  # puts "flash", flash
  # puts "session", session
  # puts "controller", @controller
  # puts "request", @request
  # puts "response", @response.@status

  setup do
    @u = users(:user1)
    sign_in @u
    @q = questions(:question1)
    @a = answers(:answer1)
  end

  teardown do
    # reset the Warden test mode after each test
    Warden.test_reset!
  end
  
  test "should post create" do
    puts "create", @q.id
    post :create, answer: {question_id: @q.id, text: "This is a test answer."}
    assert_redirected_to question_path @q.id
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
