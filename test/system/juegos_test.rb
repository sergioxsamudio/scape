require "application_system_test_case"

class JuegosTest < ApplicationSystemTestCase
  setup do
    @juego = juegos(:one)
  end

  test "visiting the index" do
    visit juegos_url
    assert_selector "h1", text: "Juegos"
  end

  test "should create juego" do
    visit juegos_url
    click_on "New juego"

    fill_in "Color botones", with: @juego.color_botones
    fill_in "Logo", with: @juego.logo
    fill_in "Titulo", with: @juego.titulo
    click_on "Create Juego"

    assert_text "Juego was successfully created"
    click_on "Back"
  end

  test "should update Juego" do
    visit juego_url(@juego)
    click_on "Edit this juego", match: :first

    fill_in "Color botones", with: @juego.color_botones
    fill_in "Logo", with: @juego.logo
    fill_in "Titulo", with: @juego.titulo
    click_on "Update Juego"

    assert_text "Juego was successfully updated"
    click_on "Back"
  end

  test "should destroy Juego" do
    visit juego_url(@juego)
    click_on "Destroy this juego", match: :first

    assert_text "Juego was successfully destroyed"
  end
end
