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
			make_batch_request(symbols, "company,stats", "#{iextrading_url}")
		end

		def get_earnings_stats_batch(symbols)
			make_batch_request(symbols, "earnings&range=1y", "#{iextrading_url}")

		end

		def get_dividends_stats_batch(symbols)
			make_batch_request(symbols, "dividends&range=1y", "#{iextrading_url}")
		end

		def get_dividend_yield_stats_batch(symbols)
			make_batch_request(symbols, "stats/dividendYield", "#{iextrading_url_new_test}")
		end

		def make_batch_request(symbols, types, url)
			puts "#{url}/stock/market/batch?symbols=#{symbols}&types=#{types}&token=Tpk_2aa25192808b4235a7802c1a2cce2631"
			result = HTTParty.get("#{url}/stock/market/batch?symbols=#{symbols}&types=#{types}&token=Tpk_2aa25192808b4235a7802c1a2cce2631")
			if result.body.include?('Unknown symbol')
				{}
			else
				JSON.parse(result.body, symbolize_names: true)
			end
		end

		def get_dividend_yield_stats(symbol)
			make_single_request(symbol, "dividendYield", "#{iextrading_url_new_test}")
		end

		def make_single_request(symbol, type, url)
			puts "#{url}/stock/#{symbol}/stats/#{type}?token=Tpk_2aa25192808b4235a7802c1a2cce2631"
			result = HTTParty.get("#{url}/stock/#{symbol}/stats/#{type}?token=Tpk_2aa25192808b4235a7802c1a2cce2631")
			if result.body.include?('Not found') || result.body.include?('Unknown symbol')
				{}
			else
				JSON.parse(result.body, symbolize_names: true)
			end
		end

		private
		def iextrading_url
			'https://api.iextrading.com/1.0/'
		end

		def iextrading_url_new_test
			'https://sandbox.iexapis.com/beta/'
		end

		def iextrading_url_new_prod
			'https://cloud.iexapis.com/beta/stock/aapl/stats/dividendYield?token=Tpk_2aa25192808b4235a7802c1a2cce2631'
		end
	end
end