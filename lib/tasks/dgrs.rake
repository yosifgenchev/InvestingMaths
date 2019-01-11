namespace :dgrs do
	desc "Adding dgrs to db"

	task update_dgrs: :environment do

			file = SimpleXlsxReader.open('./../../data/InvestingMaths_01_2019.xlsx')

			#dgrs_json = JSON.parse(file, symbolize_names: true)

			#result = IexTradingApi.get_stock_stats_batch(input)

			#dgrs_stocks = dgrs_json[:stocks]

			dgrs_stocks = file.sheets.first.rows
			puts "#{dgrs_stocks}"

			dgrs_stocks.each do |item|
				# stock = Stock.create(symbol: item[1][:company][:symbol], company_name: item[1][:company][:companyName], sector: item[1][:company][:sector], industry: item[1][:company][:industry])

				symbol_data = item[0]
				stock = Stock.find_by(symbol: symbol_data)

				if stock.nil?
					puts "Missing object for #{symbol_data}"
				else
					Dgr.create(stock: stock, dgr_1: item[1], dgr_3: item[2], dgr_5: item[3],  dgr_10: item[4], mr_inc: item[5])
				end
			end

	end
end