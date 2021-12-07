require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get generate" do
    get tickets_generate_url
    assert_response :success
  end

end
