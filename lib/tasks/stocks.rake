namespace :stocks do

	input_array = ["SRCE,MMM,AOS,AAN,ABT,ABBV,ABM,AKR,ACN,ACU,ATVI,WMS,AES,AFL,AGCO,A,ADC,AL,APD,AYR,ALK,ALB,ALX,ARE,ALLE,ALE,LNT,ALL,AIMC,MO,DOX,AEE,AAT,ACC,AEP,AEL,AXP,AFG,AWR,AMT,AWK,APU,AMP,AMSF,ABC,ATLO,AMGN,APH,ADI,ANDX,ANDE,ANTM,AON,AIV,APOG,APLO,AAPL,AIT,ATR,WTR,ARMK,ABR,ADM,ARGO,AHH,AMNF,AROW,ARTNA,AJG,ASH,AHL,ASB,AIZ,AGO,T,ATO,ATRI,AUBN,ALV,ADP,AVB,AVY,AVA,AVT,AVX,AXS,BGS,BMI,BCPC,BANF,BXS,BAC,BORT,BMRC,BK,BKSC,OZK,BKUTK,BFIN,BANR",
			   "BHB,B,BSET,BBT,BDX,BMS,BBY,BIG,BKH,BLK,BA,BOKF,BAH,BWA,BPFH,BRC,EAT,BMY,BRX,AVGO,BR,BAM,BIP,BPY,BEP,BRO,BF-B,BC,BMTC,BT,BG,CFFI,CHRW,CBT,CVGW,CWT,TYCB,CATC,CPT,CNI,CMD,CCBG,CAH,CTRE,CSL,CARO,CRI,CASY,CASS,CAT,CATY,CBOE,CCFN,CDW,FUN,CE,CNP,CPF,CCF,CAKE,CHE,CHFC,CPKF,CPK,CVX,CHS,PLCE,CB,CHD,CHDN,CINF,CTAS,CSCO,CZWI,CFG,CZFS,CHCO,CIVB,CWEN,CLX,CME,CMS,CNO,KO,CVLY,CCOI,CNS,CL,COLB,COLM,CMCSA,CMA,FIX,CBSH,CBU,CTBI,CWBC,CSVI,CTWS",
			   "ED,CTO,CORE,COR,GLW,CLDB,COST,CBRL,CCI,CSGS,CSX,CUBE,CFR,CULP,CMI,CONE,DHR,DKL,DAL,XRAY,DHIL,DLR,DDS,DFS,DLB,D,DPZ,UFS,DCI,DGICA,DGICB,PLOW,DEI,DOV,DTE,DUK,DNB,DNKN,EBMT,EFSI,EGP,EMN,ETN,EV,ECL,EIX,EE,EMCI,EMCF,EMR,ENB,EHC,ET,ENSG,EBTC,EPD,EVC,EPR,EQM,ELS,ERIE,ESCA,ESS,EL,EVBN,EVR,RE,EVRG,ES,EXSR,EXPE,EXPD,EXPO,STAY,EXR,XOM,FMBM,FDS,FMCB,FMAO,FBVA,FAST,FFG,AGM,FRT,FDX,FNF,FITB,FISI,FAF,FNLC,BUSE,FBIZ,FCBC,FCCO,FDEF,FFMR,FFIN,THFF",
			   "FHN,FR,FIBK,FRME,FMBH,FMBI,FXNC,FLIC,FRC,FSFG,FLXS,FLIR,FLO,FFIC,FL,FORR,FBHS,FNV,FELE,BEN,FSBW,GLPI,GLOP,GATX,GD,GIS,GNTX,GPC,GEO,GABC,GTY,GIL,GBCI,GAIN,GS,GT,GRC,GGG,GSBC,GBX,GFF,GPI,GBNK,GFED,FUL,HAFC,THG,HOG,HRS,HIG,HAS,HVT,HVT-A,HWKN,HWBK,HDB,HCSG,HTA,HLAN,HEI,HP,HNNA,HTBK,HFWA,MLHR,HSY,HI,HRC,HIFS,HNI,HMLP,HEP,HBCP,HOMB,HD,HFBL,HONT,HON,HOPE,HMN,HBNC,HRL,HPT,HPQ,HUBB,HUM,HBAN,HII,HURC,HY,IDA,IEX,ITW,IHC,INDB,IBCP,IBTX,IR,INGR",
			   "IOSP,NSP,IPAR,ICE,TILE,IBOC,IBM,IFF,IP,ISCA,IPG,INTU,IVZ,ISTR,ISBC,IRM,ISBA,ITT,JJSF,SJM,JCOM,JKHY,JBHT,JW-A,JNJ,JCI,JOUT,JLL,JPM,KAI,KALU,KSU,KAR,K,KW,KEQU,KEY,KMB,KIM,KINS,KRG,KLAC,KSS,KHC,KR,LLL,LBAI,LKFN,LRCX,LAMR,LANC,LARK,LSTR,LVS,LAZ,LZB,LEA,LTXB,LM,LEG,LMAT,LII,LXP,LSI,LMNR,LECO,LNC,LIN,LNN,LAD,LFUS,LMT,LOGN,LOGI,LOW,LYB,LYBC,MCBC,MAC,MFNC,MMP,MGA,MAIN,MLGF,LOAN,MAN,MFC,MPC,MCS,MKTX,MNAT,VAC,MAR,MMC,MAS,MA,MTRN,MATX,MATW",
			   "MXIM,MBFI,MKC,MCD,MGRC,MCK,MDU,MPW,MDT,MBWM,MRK,MCY,MDP,MEOH,MET,MGEE,MCHP,MSFT,MPB,MAA,MSEX,MOFG,MKSI,MINI,MC,MDLZ,TYPE,MNRO,MCO,MS,MORN,MSI,MPLX,MSA,MSM,MSCI,MYBF,MFSF,NC,NASB,NDAQ,NKSH,NFG,NHI,NHC,NATI,NNN,NHTC,NBTB,NP,NTAP,NJR,NEWM,NRZ,NEU,NXST,NEE,NEP,NLSN,NKE,NI,NDSN,NIDB,NTRS,NFBK,NRIM,NOC,NWBI,NWN,NWE,NWFL,NUS,NUE,NVDA,OVLY,OXY,OCFC,OGE,ODC,OLBK,ORI,OHI,OMC,OGS,OLP,OKE,OTEX,ORCL,OSK,OTTR,OC,ORM,OXM,GLT,PCAR,PKG,PZZA,PKBK,PH",
			   "PEGI,PDCO,PAYX,PBFX,PAG,PNR,PEBK,PPLL,PBCT,PEP,PRGO,PETS,PFE,PM,PSX,PSXP,PPBN,PNW,PNBI,PNC,PNM,PII,POL,POOL,POR,PTBS,POWI,PPG,PPL,APTS,PFBC,PRI,PRIM,PFG,PG,PLD,PB,PROV,PFS,PRU,PSB,PSBQ,PEG,QNBC,QTS,QNTO,KWR,QCOM,DGX,RJF,RTN,RMAX,O,RBC,REG,RF,RGA,RS,RNR,RBCAA,RSG,RMD,RECN,ROIC,REXR,RGCO,RBA,RLI,RHI,ROK,ROL,ROP,ROST,RCL,RGLD,RPM,RUTH,R,RHP,SPGI,STBA,SBRA,SAFM,SASR,BFS,SBFG,SWM,SMG,SEIC,SIGI,SRE,SXT,SCI,SFBS,SHEN,SHW,SHPG,SCVL,BSRR",
			   "SIG,SLGN,SFNC,SPG,SSD,SBGI,SIX,SJW,SWKS,SLG,SNA,SON,SOHO,SFBC,SJI,SSB,SO,SOMC,SMBC,SBSI,LUV,SWX,SGB,SPTN,SEP,SR,SRLP,STAG,SMP,SXI,SWK,SGU,SBUX,STT,STLD,SCS,SCL,STE,SYBT,STRT,SYK,STBI,INN,STI,SGC,SNX,SNV,SYY,TROW,SKT,TGT,TCO,AMTD,TEL,TDS,TNC,TEX,TRNO,TBNK,TTEK,TXN,TPL,TXRH,TFSL,HCKT,THVB,TRI,THO,TIF,TSBK,TKR,TJX,TMP,TR,TMK,TTC,TOWN,TSCO,TLP,TRV,TCBK,TYBT,TRN,TRUX,TRCB,TSN,USB,UDR,UGI,UMBF,UMPQ,UBSH,UNB,UNP,UBCP,UBSI,UCBI,UCFC,UFCS",
			   "UPS,UTX,UNH,UNTY,UVV,UFPI,UHT,UNM,UBA,USPH,UTMD,MTN,VLO,VLP,VGR,VVC,VTR,VZ,VFC,V,VSEC,VMC,WPC,WRB,WTBFA,GWW,WBA,WMT,DIS,WAFD,WASH,WCN,WM,WSO,WTS,WDFC,WBS,WEC,WRI,WEBK,WFC,WEN,WSBC,WTBA,WST,WABC,WGP,WES,WAB,WLK,WLKP,WRK,WHG,WEYS,WY,WHR,WMPN,WSM,WLTW,WINA,WTFC,WDFN,WOR,WPP,WSFS,WYND,XEL,XLNX,XYL,YORW,ZION,ZTS"]

	desc "Adding stocks to db"
	task add: :environment do
		json_array = JSON.parse('[{"Name":"1st Source Corp.","Symbol":"SRCE"},{"Name":"3M Company","Symbol":"MMM"},{"Name":"A.O. Smith Corp.","Symbol":"AOS"},{"Name":"ABM Industries Inc.","Symbol":"ABM"},{"Name":"AFLAC Inc.","Symbol":"AFL"},{"Name":"Air Products & Chem.","Symbol":"APD"},{"Name":"Altria Group Inc.","Symbol":"MO"},{"Name":"American States Water","Symbol":"AWR"},{"Name":"AptarGroup Inc.","Symbol":"ATR"},{"Name":"Aqua America Inc.","Symbol":"WTR"},{"Name":"Archer Daniels Midland","Symbol":"ADM"},{"Name":"Arrow Financial Corp.","Symbol":"AROW"},{"Name":"Artesian Resources","Symbol":"ARTNA"},{"Name":"AT&T Inc.","Symbol":"T"},{"Name":"Atmos Energy","Symbol":"ATO"},{"Name":"Automatic Data Proc.","Symbol":"ADP"},{"Name":"Badger Meter Inc.","Symbol":"BMI"},{"Name":"BancFirst Corp. OK","Symbol":"BANF"},{"Name":"Becton Dickinson & Co.","Symbol":"BDX"},{"Name":"Bemis Company","Symbol":"BMS"},{"Name":"Black Hills Corp.","Symbol":"BKH"},{"Name":"Brady Corp.","Symbol":"BRC"},{"Name":"Brown & Brown Inc.","Symbol":"BRO"},{"Name":"Brown-Forman Class B","Symbol":"BF-B"},{"Name":"California Water Service","Symbol":"CWT"},{"Name":"Calvin B. Taylor Bankshares Inc.","Symbol":"TYCB"},{"Name":"Carlisle Companies","Symbol":"CSL"},{"Name":"Caterpillar Inc.","Symbol":"CAT"},{"Name":"Chesapeake Financial Shares","Symbol":"CPKF"},{"Name":"Chevron Corp.","Symbol":"CVX"},{"Name":"Chubb Limited","Symbol":"CB"},{"Name":"Cincinnati Financial","Symbol":"CINF"},{"Name":"Cintas Corp.","Symbol":"CTAS"},{"Name":"Clorox Company","Symbol":"CLX"},{"Name":"Coca-Cola Company","Symbol":"KO"},{"Name":"Colgate-Palmolive Co.","Symbol":"CL"},{"Name":"Commerce Bancshares","Symbol":"CBSH"},{"Name":"Community Bank System","Symbol":"CBU"},{"Name":"Community Trust Banc.","Symbol":"CTBI"},{"Name":"Computer Services Inc.","Symbol":"CSVI"},{"Name":"Connecticut Water Service","Symbol":"CTWS"},{"Name":"Consolidated Edison","Symbol":"ED"},{"Name":"Cullen/Frost Bankers","Symbol":"CFR"},{"Name":"Donaldson Company","Symbol":"DCI"},{"Name":"Dover Corp.","Symbol":"DOV"},{"Name":"Eagle Financial Services","Symbol":"EFSI"},{"Name":"Eaton Vance Corp.","Symbol":"EV"},{"Name":"Ecolab Inc.","Symbol":"ECL"},{"Name":"Emerson Electric","Symbol":"EMR"},{"Name":"Erie Indemnity Company","Symbol":"ERIE"},{"Name":"ExxonMobil Corp.","Symbol":"XOM"},{"Name":"Farmers & Merchants Bancorp","Symbol":"FMCB"},{"Name":"Federal Realty Inv. Trust","Symbol":"FRT"},{"Name":"First Financial Corp.","Symbol":"THFF"},{"Name":"Franklin Electric Co.","Symbol":"FELE"},{"Name":"Franklin Resources","Symbol":"BEN"},{"Name":"General Dynamics","Symbol":"GD"},{"Name":"Genuine Parts Co.","Symbol":"GPC"},{"Name":"Gorman-Rupp Company","Symbol":"GRC"},{"Name":"H.B. Fuller Company","Symbol":"FUL"},{"Name":"Helmerich & Payne Inc.","Symbol":"HP"},{"Name":"Hormel Foods Corp.","Symbol":"HRL"},{"Name":"Illinois Tool Works","Symbol":"ITW"},{"Name":"Jack Henry & Associates","Symbol":"JKHY"},{"Name":"John Wiley & Sons Inc.","Symbol":"JW-A"},{"Name":"Johnson & Johnson","Symbol":"JNJ"},{"Name":"Kimberly-Clark Corp.","Symbol":"KMB"},{"Name":"Lancaster Colony Corp.","Symbol":"LANC"},{"Name":"Leggett & Platt Inc.","Symbol":"LEG"},{"Name":"Linde Plc","Symbol":"LIN"},{"Name":"Lowes Companies","Symbol":"LOW"},{"Name":"McCormick & Co.","Symbol":"MKC"},{"Name":"McDonalds Corp.","Symbol":"MCD"},{"Name":"McGrath Rentcorp","Symbol":"MGRC"},{"Name":"MDU Resources","Symbol":"MDU"},{"Name":"Medtronic plc","Symbol":"MDT"},{"Name":"Mercury General Corp.","Symbol":"MCY"},{"Name":"Meredith Corp.","Symbol":"MDP"},{"Name":"MGE Energy Inc.","Symbol":"MGEE"},{"Name":"Middlesex Water Co.","Symbol":"MSEX"},{"Name":"MSA Safety Inc.","Symbol":"MSA"},{"Name":"NACCO Industries","Symbol":"NC"},{"Name":"National Fuel Gas","Symbol":"NFG"},{"Name":"National Retail Properties","Symbol":"NNN"},{"Name":"Nordson Corp.","Symbol":"NDSN"},{"Name":"Northwest Natural Gas","Symbol":"NWN"},{"Name":"Nucor Corp.","Symbol":"NUE"},{"Name":"Old Republic International","Symbol":"ORI"},{"Name":"Parker-Hannifin Corp.","Symbol":"PH"},{"Name":"Pentair Ltd.","Symbol":"PNR"},{"Name":"Peoples United Financial","Symbol":"PBCT"},{"Name":"PepsiCo Inc.","Symbol":"PEP"},{"Name":"PPG Industries Inc.","Symbol":"PPG"},{"Name":"Procter & Gamble Co.","Symbol":"PG"},{"Name":"PSB Holdings Inc.","Symbol":"PSBQ"},{"Name":"Realty Income Corp.","Symbol":"O"},{"Name":"RLI Corp.","Symbol":"RLI"},{"Name":"Roper Technologies Inc.","Symbol":"ROP"},{"Name":"RPM International Inc.","Symbol":"RPM"},{"Name":"S&P Global Inc.","Symbol":"SPGI"},{"Name":"SEI Investments Company","Symbol":"SEIC"},{"Name":"Sherwin-Williams Co.","Symbol":"SHW"},{"Name":"SJW Corp.","Symbol":"SJW"},{"Name":"Sonoco Products Co.","Symbol":"SON"},{"Name":"Stanley Black & Decker","Symbol":"SWK"},{"Name":"Stepan Company","Symbol":"SCL"},{"Name":"Stryker Corp.","Symbol":"SYK"},{"Name":"Sysco Corp.","Symbol":"SYY"},{"Name":"T. Rowe Price Group","Symbol":"TROW"},{"Name":"Tanger Factory Outlet Centers","Symbol":"SKT"},{"Name":"Target Corp.","Symbol":"TGT"},{"Name":"Telephone & Data Sys.","Symbol":"TDS"},{"Name":"Tennant Company","Symbol":"TNC"},{"Name":"Thomson Reuters Corp.","Symbol":"TRI"},{"Name":"Tompkins Financial Corp.","Symbol":"TMP"},{"Name":"Tootsie Roll Industries","Symbol":"TR"},{"Name":"UGI Corp.","Symbol":"UGI"},{"Name":"UMB Financial Corp.","Symbol":"UMBF"},{"Name":"United Bankshares Inc.","Symbol":"UBSI"},{"Name":"United Technologies","Symbol":"UTX"},{"Name":"Universal Corp.","Symbol":"UVV"},{"Name":"Universal Health Realty Trust","Symbol":"UHT"},{"Name":"Vectren Corp.","Symbol":"VVC"},{"Name":"VF Corp.","Symbol":"VFC"},{"Name":"W.W. Grainger Inc.","Symbol":"GWW"},{"Name":"Walgreens Boots Alliance Inc.","Symbol":"WBA"},{"Name":"Wal-Mart Inc.","Symbol":"WMT"},{"Name":"West Pharmaceutical Services","Symbol":"WST"},{"Name":"Westamerica Bancorp","Symbol":"WABC"},{"Name":"Weyco Group Inc.","Symbol":"WEYS"}]', symbolized_names: true)
		json_array.each do |stock_data|
			Stock.create(symbol: stock_data['Symbol'], company_name: stock_data['Name'])
		end
	end

	task add_stocks_bulk: :environment do

		input_array.each do |input|
			result = IexTradingApi.get_stock_stats_batch(input)

			result.each do |item|
				symbol_data = item[1][:company][:symbol]
				stock = Stock.find_by(symbol: symbol_data)

				# if stock.nil?
					# stock = Stock.create(symbol: item[1][:company][:symbol], company_name: item[1][:company][:companyName], sector: item[1][:company][:sector], industry: item[1][:company][:industry])
				# end

				# if stock.nil?
				# 	puts "Missing object for #{symbol_data}"
				# else
					puts "Adding stats info #{item[1][:stats]} for #{stock.symbol}"
					Stat.create(stock: stock, dividend_yield: item[1][:stats][:dividendYield])
				# end
		end

		end
	end

	task add_earnings_bulk: :environment do

		input_array.each do |input|
			result = IexTradingApi.get_earnings_stats_batch(input)

			result.each do |item|
				earnings = item[1][:earnings][:earnings]
				symbol_data = item[1][:earnings][:symbol]
				stock = Stock.find_by(symbol: symbol_data)

				if stock.nil?
					puts "Missing object for #{symbol_data}"
				else
					# Earning.where(stock: stock).delete_all

					puts "#{stock.symbol}"

					earnings_sum = 0
					earnings.each do |earning|
						amount = earning[:actualEPS]
						if amount.is_a? Integer or amount.is_a? Float
							earnings_sum = earnings_sum + amount
						end
					end
					
					stock.update_attribute(:earnings_amount, earnings_sum)

					# earnings.each do |earning|
					# 	puts "#{earning[:actualEPS]} EPS for fiscal period #{earning[:fiscalPeriod]}"
					# 	Earning.create(stock: stock, actualEPS: earning[:actualEPS])
					# end
				end
			end

		end
	end

	task add_im_index_bulk: :environment do

		input_array.each do |input|

			puts "#{input}"
			input.split(',').each do |item|
				stock = Stock.find_by(symbol: item)

				if stock.nil?
					puts "Missing object for #{item}"
				else
					# Dividend.where(stock: stock).delete_all

					puts "#{item}"

					# dividends_sum = dividends.inject(0){ |sum,x| sum + x[:amount] }

					# dividends_sum = 0
					# dividends.each do |dividend|
					# 	amount = dividend[:amount]
					# 	if amount.is_a? Integer or amount.is_a? Float
					# 		dividends_sum = dividends_sum + amount
					# 	end
					# end

					im_index = stock.im_index_func
					puts "#{im_index}"
					
					if im_index.infinite?
						stock.update_attribute(:im_index, 0)
					else
						stock.update_attribute(:im_index, im_index)
					end
					# dividends.each do |dividend|
					# 	puts "#{dividend[:amount]} dividend declared at #{dividend[:declaredDate]}"
					# 	Dividend.create(stock: stock, amount: dividend[:amount])
					# end
				end
			end

		end
	end

	task add_dividends_bulk: :environment do

		input_array.each do |input|
			result = IexTradingApi.get_dividends_stats_batch(input)

			result.each do |item|
				dividends = item[1][:dividends]
				symbol_data = item[0]
				stock = Stock.find_by(symbol: symbol_data)

				if stock.nil?
					puts "Missing object for #{symbol_data}"
				else
					# Dividend.where(stock: stock).delete_all

					puts "#{stock.symbol}"

					# dividends_sum = dividends.inject(0){ |sum,x| sum + x[:amount] }

					dividends_sum = 0
					dividends.each do |dividend|
						amount = dividend[:amount]
						if amount.is_a? Integer or amount.is_a? Float
							dividends_sum = dividends_sum + amount
						end
					end

					puts "#{dividends_sum}"
					
					stock.update_attribute(:dividends_amount, dividends_sum)
					# dividends.each do |dividend|
					# 	puts "#{dividend[:amount]} dividend declared at #{dividend[:declaredDate]}"
					# 	Dividend.create(stock: stock, amount: dividend[:amount])
					# end
				end
			end

		end
	end

	task add_logos: :environment do
		require 'open-uri'
		Stock.all.each do |stock|
			open(Rails.root.join('app/assets/images/logos', "#{stock.symbol}.png"), 'wb') do |file|
			  file << open("https://storage.googleapis.com/iex/api/logos/#{stock.symbol}.png").read
			end
		end
	end

	task update_stats: :environment do

			file = SimpleXlsxReader.open('data/InvestingMaths_stats.xlsx')

			dgrs_stocks = file.sheets.first.rows
			puts "#{dgrs_stocks}"

			counter = 0;
			dgrs_stocks.each do |item|

				symbol_data = item[2]
				# puts "#{symbol_data}"

				stock = Stock.find_by(symbol: symbol_data)


				if stock.nil?
					# puts "Missing object for #{symbol_data}"
				else 
					net_income = item[3]
					total_dividends = item[4]
					total_debt = item[5]
					total_assets = item[6]
					total_liabilities = item[7]

					ebit = item[11]
					ev = item[16]

					stock.update_attribute(:net_income, net_income)
					stock.update_attribute(:total_dividends, total_dividends)
					stock.update_attribute(:total_debt, total_debt)
					stock.update_attribute(:total_assets, total_assets)
					stock.update_attribute(:total_liabilities, total_liabilities)

					roic = ((net_income.to_f + total_dividends.to_f)/(total_debt.to_f + (total_assets.to_f - total_liabilities.to_f)) * 100).round(1)

					counter = counter + 1;

					puts "ROIC for #{symbol_data} is #{roic}"

					stock.update_attribute(:roic, roic)

					ev_to_ebit = (ev.to_f/ebit.to_f).round(2)

					puts "EV/EBIT for #{symbol_data} is #{ev_to_ebit}"

					stock.update_attribute(:ev_to_ebit, ev_to_ebit)

				end
			end
			puts "Total stocks: #{counter}"

	end

end