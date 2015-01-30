require 'test_helper'

class UsersControllerTest < ActionController::TestCase
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
    # needed setup code before each test would go here
  end

  teardown do
    # reset the Warden test mode after each test
    Warden.test_reset!
  end

  test "anon user should get new and redirect to session sign-in" do
    get :new
    assert :success
    assert_redirected_to new_user_session_path, "Did not redirect to new user session sign-in"
  end
  
  # WIP: difficulty getting this test to work with devise
  # test "should get create" do
  #   params = {
  #     user: {
  #       email: "test@test.com",
  #       password: "abcd1234",
  #       presenter: false
  #     }
  #   }
  #   post :create
  #   assert :success
  #   #assert_response :success, "Did not succeed in getting create"
  # end

  test "should get destroy and redirect to " do
    user1 = users(:user1)

    @user = user1

    sign_in @user

    get :destroy, {id: 339}, {user_id: @user.id}

    assert_response :redirect, "Did not succeed"
    assert_redirected_to root_path, "Did not redirect to the root path"
  end

  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end

  test "Authenicated user should get index" do
    user1 = users :user1
    @user = user1

    sign_in @user

    get :index

    assert_response :success, "Authenticated user did not get index"
  end

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
