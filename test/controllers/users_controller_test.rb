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
    @user = users(:user1)
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
  
  test "should get create" do
    post :create, user: {email: "test123@test.com", password: "abcd1234", presenter: false}
    assert_redirected_to root_path
  end

  test "should get destroy and redirect to " do
    sign_in @user

    delete :destroy, id: @user.id

    assert_redirected_to root_path, "Did not redirect to the root path"
  end

  test "should get edit" do
    sign_in @user

    get :edit, id: @user.id

    assert_response :success
  end

  test "Authenicated user should get index" do
    sign_in users(:user1)

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
