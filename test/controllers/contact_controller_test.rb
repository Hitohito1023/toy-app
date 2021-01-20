require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get contact_new_url
    assert_response :success
  end

  test "should get confirm" do
    get contact_confirm_url
    assert_response :success
  end

  test "should get thanks" do
    get contact_thanks_url
    assert_response :success
  end

end
