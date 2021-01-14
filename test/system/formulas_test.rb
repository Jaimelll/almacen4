require "application_system_test_case"

class FormulasTest < ApplicationSystemTestCase
  setup do
    @formula = formulas(:one)
  end

  test "visiting the index" do
    visit formulas_url
    assert_selector "h1", text: "Formulas"
  end

  test "creating a Formula" do
    visit formulas_url
    click_on "New Formula"

    fill_in "Integer", with: @formula.integer
    fill_in "Material", with: @formula.material
    click_on "Create Formula"

    assert_text "Formula was successfully created"
    click_on "Back"
  end

  test "updating a Formula" do
    visit formulas_url
    click_on "Edit", match: :first

    fill_in "Integer", with: @formula.integer
    fill_in "Material", with: @formula.material
    click_on "Update Formula"

    assert_text "Formula was successfully updated"
    click_on "Back"
  end

  test "destroying a Formula" do
    visit formulas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Formula was successfully destroyed"
  end
end
