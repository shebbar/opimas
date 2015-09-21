json.array!(@report_subscriptions) do |report_subscription|
  json.extract! report_subscription, :id, :report_id, :report_subscriber_id
  json.url report_subscription_url(report_subscription, format: :json)
end
