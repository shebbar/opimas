json.array!(@report_subscribers) do |report_subscriber|
  json.extract! report_subscriber, :id, :company_id, :contract_start_date, :contract_end_date, :contract_currency, :contract_value
  json.url report_subscriber_url(report_subscriber, format: :json)
end
