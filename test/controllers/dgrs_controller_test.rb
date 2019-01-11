require 'test_helper'

class DgrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dgr = dgrs(:one)
  end

  test "should get index" do
    get dgrs_url
    assert_response :success
  end

  test "should get new" do
    get new_dgr_url
    assert_response :success
  end

  test "should create dgr" do
    assert_difference('Dgr.count') do
      post dgrs_url, params: { dgr: { dgr_1: @dgr.dgr_1, dgr_10: @dgr.dgr_10, dgr_3: @dgr.dgr_3, dgr_5: @dgr.dgr_5, mr_inc: @dgr.mr_inc, stock_id: @dgr.stock_id } }
    end

    assert_redirected_to dgr_url(Dgr.last)
  end

  test "should show dgr" do
    get dgr_url(@dgr)
    assert_response :success
  end

  test "should get edit" do
    get edit_dgr_url(@dgr)
    assert_response :success
  end

  test "should update dgr" do
    patch dgr_url(@dgr), params: { dgr: { dgr_1: @dgr.dgr_1, dgr_10: @dgr.dgr_10, dgr_3: @dgr.dgr_3, dgr_5: @dgr.dgr_5, mr_inc: @dgr.mr_inc, stock_id: @dgr.stock_id } }
    assert_redirected_to dgr_url(@dgr)
  end

  test "should destroy dgr" do
    assert_difference('Dgr.count', -1) do
      delete dgr_url(@dgr)
    end

    assert_redirected_to dgrs_url
  end
end
