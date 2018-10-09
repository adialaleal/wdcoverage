require "application_system_test_case"

class TonersTest < ApplicationSystemTestCase
  setup do
    @toner = toners(:one)
  end

  test "visiting the index" do
    visit toners_url
    assert_selector "h1", text: "Toners"
  end

  test "creating a Toner" do
    visit toners_url
    click_on "New Toner"

    fill_in "Client", with: @toner.client
    fill_in "Count End", with: @toner.count_end
    fill_in "Count Ini", with: @toner.count_ini
    fill_in "Date In", with: @toner.date_in
    fill_in "Date Out", with: @toner.date_out
    fill_in "Device", with: @toner.device
    fill_in "Nvl End", with: @toner.nvl_end
    fill_in "Nvl Ini", with: @toner.nvl_ini
    fill_in "Part Number", with: @toner.part_number
    fill_in "Serial Number", with: @toner.serial_number
    fill_in "Tcolor", with: @toner.tcolor
    fill_in "Tyield", with: @toner.tyield
    click_on "Create Toner"

    assert_text "Toner was successfully created"
    click_on "Back"
  end

  test "updating a Toner" do
    visit toners_url
    click_on "Edit", match: :first

    fill_in "Client", with: @toner.client
    fill_in "Count End", with: @toner.count_end
    fill_in "Count Ini", with: @toner.count_ini
    fill_in "Date In", with: @toner.date_in
    fill_in "Date Out", with: @toner.date_out
    fill_in "Device", with: @toner.device
    fill_in "Nvl End", with: @toner.nvl_end
    fill_in "Nvl Ini", with: @toner.nvl_ini
    fill_in "Part Number", with: @toner.part_number
    fill_in "Serial Number", with: @toner.serial_number
    fill_in "Tcolor", with: @toner.tcolor
    fill_in "Tyield", with: @toner.tyield
    click_on "Update Toner"

    assert_text "Toner was successfully updated"
    click_on "Back"
  end

  test "destroying a Toner" do
    visit toners_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Toner was successfully destroyed"
  end
end
