json.array!(@category_subscribers) do |category_subscriber|
  json.extract! category_subscriber, :id, :company_id, :contract_start_date, :contract_end_date, :contract_currency, :contract_value
  json.url category_subscriber_url(category_subscriber, format: :json)
end
