require "test_helper"

class BusquedasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get busquedas_new_url
    assert_response :success
  end

  test "should get create" do
    get busquedas_create_url
    assert_response :success
  end
end
