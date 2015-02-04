require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
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
    @q = questions(:question1)
  end

  teardown do
    # reset the Warden test mode after each test
    Warden.test_reset!
  end

  test "should post create" do
    post :create
    assert_redirected_to user_session_path
  end

  test "should get destroy" do
    get :destroy, id: @q.id
    assert_redirected_to user_session_path
  end

  test "should get edit" do
    get :edit, id: @q.id
    assert_redirected_to user_session_path
  end

  test "should get index" do
    get :index
    assert_redirected_to user_session_path
  end

  test "should get new" do
    get :new
    assert_redirected_to user_session_path
  end

  test "should get show" do
    get :show, id: @q.id
    assert_redirected_to user_session_path
  end

  test "should get update" do
    put :update, id: @q.id
    assert_redirected_to user_session_path
  end

end
