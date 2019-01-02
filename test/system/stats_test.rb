require "application_system_test_case"

class StatsTest < ApplicationSystemTestCase
  setup do
    @stat = stats(:one)
  end

  test "visiting the index" do
    visit stats_url
    assert_selector "h1", text: "Stats"
  end

  test "creating a Stat" do
    visit stats_url
    click_on "New Stat"

    fill_in "Current price", with: @stat.current_price
    fill_in "Dividend yield", with: @stat.dividend_yield
    fill_in "Drip years count", with: @stat.drip_years_count
    fill_in "Stock", with: @stat.stock_id
    click_on "Create Stat"

    assert_text "Stat was successfully created"
    click_on "Back"
  end

  test "updating a Stat" do
    visit stats_url
    click_on "Edit", match: :first

    fill_in "Current price", with: @stat.current_price
    fill_in "Dividend yield", with: @stat.dividend_yield
    fill_in "Drip years count", with: @stat.drip_years_count
    fill_in "Stock", with: @stat.stock_id
    click_on "Update Stat"

    assert_text "Stat was successfully updated"
    click_on "Back"
  end

  test "destroying a Stat" do
    visit stats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stat was successfully destroyed"
  end
end
