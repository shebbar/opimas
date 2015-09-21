require 'test_helper'

class CategorySubscribersControllerTest < ActionController::TestCase
  setup do
    @category_subscriber = category_subscribers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_subscribers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_subscriber" do
    assert_difference('CategorySubscriber.count') do
      post :create, category_subscriber: { company_id: @category_subscriber.company_id, contract_currency: @category_subscriber.contract_currency, contract_end_date: @category_subscriber.contract_end_date, contract_start_date: @category_subscriber.contract_start_date, contract_value: @category_subscriber.contract_value }
    end

    assert_redirected_to category_subscriber_path(assigns(:category_subscriber))
  end

  test "should show category_subscriber" do
    get :show, id: @category_subscriber
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category_subscriber
    assert_response :success
  end

  test "should update category_subscriber" do
    patch :update, id: @category_subscriber, category_subscriber: { company_id: @category_subscriber.company_id, contract_currency: @category_subscriber.contract_currency, contract_end_date: @category_subscriber.contract_end_date, contract_start_date: @category_subscriber.contract_start_date, contract_value: @category_subscriber.contract_value }
    assert_redirected_to category_subscriber_path(assigns(:category_subscriber))
  end

  test "should destroy category_subscriber" do
    assert_difference('CategorySubscriber.count', -1) do
      delete :destroy, id: @category_subscriber
    end

    assert_redirected_to category_subscribers_path
  end
end
