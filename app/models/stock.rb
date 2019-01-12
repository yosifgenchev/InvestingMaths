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
    stats.last.dividend_yield
  end

  def im_index
    date_key = self.updated_at

    cache_key = "imIndexData|#{id}|#{date_key}"

    Rails.cache.fetch(cache_key, expires_in: 1.hours) do
        if (dgr.present?)
          ((dgr.dgr_1 + dgr.dgr_3 + dgr.dgr_5 + dgr.dgr_10 + dgr.dgr_10)/5 + dgr.mr_inc + last_dividend_yield**2).round(1)
        else
          0
        end
    end
  end
end
