json.extract! stock, :id, :symbol, :company_name, :created_at, :updated_at
json.url stock_url(stock, format: :json)
