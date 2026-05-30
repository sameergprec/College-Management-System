require "test_helper"

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get departments_dashboard_url
    assert_response :success
  end
end
