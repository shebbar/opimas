require 'test_helper'

class ReportSubscribersControllerTest < ActionController::TestCase
  setup do
    @report_subscriber = report_subscribers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_subscribers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_subscriber" do
    assert_difference('ReportSubscriber.count') do
      post :create, report_subscriber: { company_id: @report_subscriber.company_id, contract_currency: @report_subscriber.contract_currency, contract_end_date: @report_subscriber.contract_end_date, contract_start_date: @report_subscriber.contract_start_date, contract_value: @report_subscriber.contract_value }
    end

    assert_redirected_to report_subscriber_path(assigns(:report_subscriber))
  end

  test "should show report_subscriber" do
    get :show, id: @report_subscriber
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report_subscriber
    assert_response :success
  end

  test "should update report_subscriber" do
    patch :update, id: @report_subscriber, report_subscriber: { company_id: @report_subscriber.company_id, contract_currency: @report_subscriber.contract_currency, contract_end_date: @report_subscriber.contract_end_date, contract_start_date: @report_subscriber.contract_start_date, contract_value: @report_subscriber.contract_value }
    assert_redirected_to report_subscriber_path(assigns(:report_subscriber))
  end

  test "should destroy report_subscriber" do
    assert_difference('ReportSubscriber.count', -1) do
      delete :destroy, id: @report_subscriber
    end

    assert_redirected_to report_subscribers_path
  end
end
