require 'test_helper'

class CategorySubscriptionsControllerTest < ActionController::TestCase
  setup do
    @category_subscription = category_subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_subscription" do
    assert_difference('CategorySubscription.count') do
      post :create, category_subscription: { category_id: @category_subscription.category_id, category_subscriber_id: @category_subscription.category_subscriber_id }
    end

    assert_redirected_to category_subscription_path(assigns(:category_subscription))
  end

  test "should show category_subscription" do
    get :show, id: @category_subscription
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category_subscription
    assert_response :success
  end

  test "should update category_subscription" do
    patch :update, id: @category_subscription, category_subscription: { category_id: @category_subscription.category_id, category_subscriber_id: @category_subscription.category_subscriber_id }
    assert_redirected_to category_subscription_path(assigns(:category_subscription))
  end

  test "should destroy category_subscription" do
    assert_difference('CategorySubscription.count', -1) do
      delete :destroy, id: @category_subscription
    end

    assert_redirected_to category_subscriptions_path
  end
end
