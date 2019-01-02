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
			result = HTTParty.get("#{iextrading_url}/stock/market/batch?symbols=#{symbols}&types=company,stats")
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