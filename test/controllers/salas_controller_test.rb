require "test_helper"

class SalasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sala = salas(:one)
  end

  test "should get index" do
    get salas_url
    assert_response :success
  end

  test "should get new" do
    get new_sala_url
    assert_response :success
  end

  test "should create sala" do
    assert_difference("Sala.count") do
      post salas_url, params: { sala: { imagen: @sala.imagen, juego_id: @sala.juego_id, respuesta1: @sala.respuesta1, respuesta2: @sala.respuesta2, respuesta3: @sala.respuesta3, tiempo: @sala.tiempo } }
    end

    assert_redirected_to sala_url(Sala.last)
  end

  test "should show sala" do
    get sala_url(@sala)
    assert_response :success
  end

  test "should get edit" do
    get edit_sala_url(@sala)
    assert_response :success
  end

  test "should update sala" do
    patch sala_url(@sala), params: { sala: { imagen: @sala.imagen, juego_id: @sala.juego_id, respuesta1: @sala.respuesta1, respuesta2: @sala.respuesta2, respuesta3: @sala.respuesta3, tiempo: @sala.tiempo } }
    assert_redirected_to sala_url(@sala)
  end

  test "should destroy sala" do
    assert_difference("Sala.count", -1) do
      delete sala_url(@sala)
    end

    assert_redirected_to salas_url
  end
end
