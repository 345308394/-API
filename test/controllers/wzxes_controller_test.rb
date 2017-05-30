require 'test_helper'

class WzxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wzx = wzxes(:one)
  end

  test "should get index" do
    get wzxes_url
    assert_response :success
  end

  test "should get new" do
    get new_wzx_url
    assert_response :success
  end

  test "should create wzx" do
    assert_difference('Wzx.count') do
      post wzxes_url, params: { wzx: { food: @wzx.food, information: @wzx.information, name: @wzx.name, tuijian: @wzx.tuijian } }
    end

    assert_redirected_to wzx_url(Wzx.last)
  end

  test "should show wzx" do
    get wzx_url(@wzx)
    assert_response :success
  end

  test "should get edit" do
    get edit_wzx_url(@wzx)
    assert_response :success
  end

  test "should update wzx" do
    patch wzx_url(@wzx), params: { wzx: { food: @wzx.food, information: @wzx.information, name: @wzx.name, tuijian: @wzx.tuijian } }
    assert_redirected_to wzx_url(@wzx)
  end

  test "should destroy wzx" do
    assert_difference('Wzx.count', -1) do
      delete wzx_url(@wzx)
    end

    assert_redirected_to wzxes_url
  end
end
