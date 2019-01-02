namespace :stats do
	desc "Getting stats for a particular stock"
	task :get_stock_stats, [:symbol] => [:environment] do |t, args|

		result = IexTradingApi.get_stock_stats(args[:symbol])
		stock = Stock.find_by(symbol: args[:symbol])
		Stat.create(stock: stock, dividend_yield: result[:dividendYield])
	end

	task get_stock_stats_bulk: :environment do
		Stock.all.each do |stock|
			sleep 1
			result = IexTradingApi.get_stock_stats(stock.symbol)

			if result.empty? 
				puts "Empty result for #{stock.symbol}"
			else 
				div_yield = result[:dividendYield]
				Stat.create(stock: stock, dividend_yield: div_yield)
				puts "Currently on #{stock.symbol} #{div_yield}"
			end
		end
	end
end