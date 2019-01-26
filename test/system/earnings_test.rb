require "application_system_test_case"

class EarningsTest < ApplicationSystemTestCase
  setup do
    @earning = earnings(:one)
  end

  test "visiting the index" do
    visit earnings_url
    assert_selector "h1", text: "Earnings"
  end

  test "creating a Earning" do
    visit earnings_url
    click_on "New Earning"

    fill_in "Actualeps", with: @earning.actualEPS
    fill_in "Stock", with: @earning.stock_id
    click_on "Create Earning"

    assert_text "Earning was successfully created"
    click_on "Back"
  end

  test "updating a Earning" do
    visit earnings_url
    click_on "Edit", match: :first

    fill_in "Actualeps", with: @earning.actualEPS
    fill_in "Stock", with: @earning.stock_id
    click_on "Update Earning"

    assert_text "Earning was successfully updated"
    click_on "Back"
  end

  test "destroying a Earning" do
    visit earnings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Earning was successfully destroyed"
  end
end
