require 'test_helper'

class TonersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @toner = toners(:one)
  end

  test "should get index" do
    get toners_url
    assert_response :success
  end

  test "should get new" do
    get new_toner_url
    assert_response :success
  end

  test "should create toner" do
    assert_difference('Toner.count') do
      post toners_url, params: { toner: { client: @toner.client, count_end: @toner.count_end, count_ini: @toner.count_ini, date_in: @toner.date_in, date_out: @toner.date_out, device: @toner.device, nvl_end: @toner.nvl_end, nvl_ini: @toner.nvl_ini, part_number: @toner.part_number, serial_number: @toner.serial_number, tcolor: @toner.tcolor, tyield: @toner.tyield } }
    end

    assert_redirected_to toner_url(Toner.last)
  end

  test "should show toner" do
    get toner_url(@toner)
    assert_response :success
  end

  test "should get edit" do
    get edit_toner_url(@toner)
    assert_response :success
  end

  test "should update toner" do
    patch toner_url(@toner), params: { toner: { client: @toner.client, count_end: @toner.count_end, count_ini: @toner.count_ini, date_in: @toner.date_in, date_out: @toner.date_out, device: @toner.device, nvl_end: @toner.nvl_end, nvl_ini: @toner.nvl_ini, part_number: @toner.part_number, serial_number: @toner.serial_number, tcolor: @toner.tcolor, tyield: @toner.tyield } }
    assert_redirected_to toner_url(@toner)
  end

  test "should destroy toner" do
    assert_difference('Toner.count', -1) do
      delete toner_url(@toner)
    end

    assert_redirected_to toners_url
  end
end
