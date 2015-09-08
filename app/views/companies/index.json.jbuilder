json.array!(@companies) do |company|
  json.extract! company, :id, :name, :contact_name, :address_1, :address_2, :region, :country, :user_id, :subscription_id
  json.url company_url(company, format: :json)
end
