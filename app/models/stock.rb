class Stock < ApplicationRecord
	has_many :stats, -> { order(created_at: :desc) }
  has_one :dgr

	validates_uniqueness_of :symbol

  def last_two_stats
    date_key = self.updated_at

    cache_key = "lastTwoStatsData|#{id}|#{date_key}"

    Rails.cache.fetch(cache_key, expires_in: 1.hours) do
      stats.order(created_at: :desc).limit(2)
    end

  end

  def dividend_change
  	last_two_stats[0].dividend_yield - last_two_stats[1].dividend_yield
  end

  def dividend_change_percentage
  	((dividend_change() * 100) / last_two_stats[0].dividend_yield).round(2)
  end

  def last_dividend_yield
    stats.last.dividend_yield.round(2)
  end

  def dividend_payout_ratio
    if self.dividends_amount.present? and self.earnings_amount.present?
        ((self.dividends_amount / self.earnings_amount) * 100).round(1)
    else
      0
    end
  end

  def dgr_median
    date_key = self.updated_at

    cache_key = "lastDgrData|#{id}|#{date_key}"

    Rails.cache.fetch(cache_key, expires_in: 1.hours) do
        (dgr.dgr_1 + dgr.dgr_3 + dgr.dgr_5 + dgr.dgr_10 + dgr.dgr_10)/10
    end
  end

  def calculate
    x = dividend_payout_ratio
    if x > 100
      (x - 50)*-1
    elsif x > 0
      100 - x
    else 
      0
    end
  end

  def im_index
    date_key = self.updated_at

    cache_key = "imIndexData|#{id}|#{date_key}"

    Rails.cache.fetch(cache_key, expires_in: 1.hours) do
        if (dgr.present?)
          # ((dgr.dgr_1 + dgr.dgr_3 + dgr.dgr_5 + dgr.dgr_10 + dgr.dgr_10)/5 + dgr.mr_inc + last_dividend_yield**2).round(1)
            (dgr_median + last_dividend_yield + last_dividend_yield*calculate).round(1)
        else
          0
        end
    end
  end

   filterrific(
     available_filters: [
       :search_query
     ]
   )

  scope :search_query, lambda { |query|
    return nil if query.blank?
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 4
    where(
      terms.map {
        or_clauses = [
          "LOWER(stocks.symbol) LIKE ?",
          "LOWER(stocks.company_name) LIKE ?",
          "LOWER(stocks.sector) LIKE ?",
          "LOWER(stocks.industry) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

end
