class IexTradingApi
	class << self
		def get_stock_stats(symbol)
			result = HTTParty.get("#{iextrading_url}/stock/#{symbol}/stats")
			if result.body.include?('Unknown symbol')
				{}
			else
				JSON.parse(result.body, symbolize_names: true)
			end
		end

		def get_stock_stats_batch(symbols)
			make_batch_request(symbols, "company,stats")
		end

		def get_earnings_stats_batch(symbols)
			make_batch_request(symbols, "earnings&range=1y")

		end

		def get_dividends_stats_batch(symbols)
			make_batch_request(symbols, "dividends&range=1y")
		end

		def make_batch_request(symbols, types)
			result = HTTParty.get("#{iextrading_url}/stock/market/batch?symbols=#{symbols}&types=#{types}")
			if result.body.include?('Unknown symbol')
				{}
			else
				JSON.parse(result.body, symbolize_names: true)
			end
		end
		private

		def iextrading_url
			'https://api.iextrading.com/1.0/'
		end
	end
end