require 'test_helper'

class AvailibilitiesControllerTest < ActionController::TestCase
  setup do
    @availibility = availibilities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:availibilities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create availibility" do
    assert_difference('Availibility.count') do
      post :create, availibility: { contractor_id: @availibility.contractor_id, day: @availibility.day, end_time: @availibility.end_time, start_time: @availibility.start_time }
    end

    assert_redirected_to availibility_path(assigns(:availibility))
  end

  test "should show availibility" do
    get :show, id: @availibility
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @availibility
    assert_response :success
  end

  test "should update availibility" do
    patch :update, id: @availibility, availibility: { contractor_id: @availibility.contractor_id, day: @availibility.day, end_time: @availibility.end_time, start_time: @availibility.start_time }
    assert_redirected_to availibility_path(assigns(:availibility))
  end

  test "should destroy availibility" do
    assert_difference('Availibility.count', -1) do
      delete :destroy, id: @availibility
    end

    assert_redirected_to availibilities_path
  end
end
