require 'test_helper'

class ReportSubscriptionsControllerTest < ActionController::TestCase
  setup do
    @report_subscription = report_subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_subscription" do
    assert_difference('ReportSubscription.count') do
      post :create, report_subscription: { report_id: @report_subscription.report_id, report_subscriber_id: @report_subscription.report_subscriber_id }
    end

    assert_redirected_to report_subscription_path(assigns(:report_subscription))
  end

  test "should show report_subscription" do
    get :show, id: @report_subscription
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report_subscription
    assert_response :success
  end

  test "should update report_subscription" do
    patch :update, id: @report_subscription, report_subscription: { report_id: @report_subscription.report_id, report_subscriber_id: @report_subscription.report_subscriber_id }
    assert_redirected_to report_subscription_path(assigns(:report_subscription))
  end

  test "should destroy report_subscription" do
    assert_difference('ReportSubscription.count', -1) do
      delete :destroy, id: @report_subscription
    end

    assert_redirected_to report_subscriptions_path
  end
end
