require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:rhys)  
    @events = events(:christmas)
  end

  test "should get index" do
    get events_path
    assert_response :success
  end

end
