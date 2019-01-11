require "application_system_test_case"

class DgrsTest < ApplicationSystemTestCase
  setup do
    @dgr = dgrs(:one)
  end

  test "visiting the index" do
    visit dgrs_url
    assert_selector "h1", text: "Dgrs"
  end

  test "creating a Dgr" do
    visit dgrs_url
    click_on "New Dgr"

    fill_in "Dgr 1", with: @dgr.dgr_1
    fill_in "Dgr 10", with: @dgr.dgr_10
    fill_in "Dgr 3", with: @dgr.dgr_3
    fill_in "Dgr 5", with: @dgr.dgr_5
    fill_in "Mr inc", with: @dgr.mr_inc
    fill_in "Stock", with: @dgr.stock_id
    click_on "Create Dgr"

    assert_text "Dgr was successfully created"
    click_on "Back"
  end

  test "updating a Dgr" do
    visit dgrs_url
    click_on "Edit", match: :first

    fill_in "Dgr 1", with: @dgr.dgr_1
    fill_in "Dgr 10", with: @dgr.dgr_10
    fill_in "Dgr 3", with: @dgr.dgr_3
    fill_in "Dgr 5", with: @dgr.dgr_5
    fill_in "Mr inc", with: @dgr.mr_inc
    fill_in "Stock", with: @dgr.stock_id
    click_on "Update Dgr"

    assert_text "Dgr was successfully updated"
    click_on "Back"
  end

  test "destroying a Dgr" do
    visit dgrs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dgr was successfully destroyed"
  end
end
