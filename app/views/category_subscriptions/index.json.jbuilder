json.array!(@category_subscriptions) do |category_subscription|
  json.extract! category_subscription, :id, :category_id, :category_subscriber_id
  json.url category_subscription_url(category_subscription, format: :json)
end
