require "test_helper"

class JuegoPlayControllerTest < ActionDispatch::IntegrationTest
  test "should get show_sala" do
    get juego_play_show_sala_url
    assert_response :success
  end

  test "should get resultado" do
    get juego_play_resultado_url
    assert_response :success
  end
end
