require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # needed for devise and warden
  include Devise::TestHelpers
  include Warden::Test::Helpers
  # start warden test mode
  Warden.test_mode!

  setup do

  end

  teardown do
    # reset the Warden test mode after each test
    Warden.test_reset!
  end

  test "should get new" do
    get :new
    assert_redirected_to new_user_session_path
  end
  
  # ******* Below tests are default, created by rails ***********
  # test "should get create" do
  #   get :create
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end

  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

end
