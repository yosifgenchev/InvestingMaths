class Stock < ApplicationRecord
	has_many :stats, -> { order(created_at: :desc) }
  has_many :earning, -> { order(created_at: :desc) }
  has_many :dividend, -> { order(created_at: :desc) }
  has_one :dgr

	validates_uniqueness_of :symbol

  def last_two_stats
    date_key = self.updated_at

    cache_key = "lastTwoStatsData|#{id}|#{date_key}"

    Rails.cache.fetch(cache_key, expires_in: 1.hours) do
      stats.order(created_at: :desc).limit(2)
    end

  end

  def last_earnings
    date_key = self.updated_at

    cache_key = "lastEarningsData|#{id}|#{date_key}"

    Rails.cache.fetch(cache_key, expires_in: 1.hours) do
      earning.all
    end
  end

  def last_dividends
    date_key = self.updated_at

    cache_key = "lastDividendsData|#{id}|#{date_key}"

    Rails.cache.fetch(cache_key, expires_in: 1.hours) do
      dividend.all
    end
  end

  def dividend_change
  	last_two_stats[0].dividend_yield - last_two_stats[1].dividend_yield
  end

  def dividend_change_percentage
  	((dividend_change() * 100) / last_two_stats[0].dividend_yield).round(2)
  end

  def last_dividend_yield
    stats.last.dividend_yield
  end

  def dividend_payout_ratio
    if dividend.present? and earning.present?
        div = 0
        eps = 0
        dividend.each do |d|
          if d.amount.present?
              div = div + d.amount
          else
            div = div + 0
          end
        end
        earning.each do |e|
          if e.actualEPS.present?
              eps = eps + e.actualEPS
          else
            eps = eps + 0
          end
        end
        ((div / eps) * 100).round(1)
    else
      0
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

    x = dividend_payout_ratio.dup
    cache_key = "imIndexData|#{id}|#{date_key}"

    Rails.cache.fetch(cache_key, expires_in: 1.hours) do
        if (dgr.present?)
          # ((dgr.dgr_1 + dgr.dgr_3 + dgr.dgr_5 + dgr.dgr_10 + dgr.dgr_10)/5 + dgr.mr_inc + last_dividend_yield**2).round(1)
            ((dgr.dgr_1 + dgr.dgr_3 + dgr.dgr_5 + dgr.dgr_10 + dgr.dgr_10)/10 + last_dividend_yield**2 + calculate).round(1)
        else
          0
        end
    end
  end
end
