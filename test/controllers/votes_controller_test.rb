require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  # needed for devise and warden
  include Devise::TestHelpers
  include Warden::Test::Helpers
  # start warden test mode
  Warden.test_mode!

  setup do
    # needed setup code before each test would go here
  end

  teardown do
    # reset the Warden test mode after each test
    Warden.test_reset!
  end
  
  test "should get create" do
    get :create
    assert_response :success
  end

end
