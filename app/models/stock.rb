class Stock < ApplicationRecord
	has_many :stats, -> { order(created_at: :desc) }
  has_one :dgr

	validates_uniqueness_of :symbol

  @dividend_change_percent
  @im_index

  def last_two_stats
    stats.order(created_at: :desc).limit(2)
  end

  def dividend_change_percentage
    ((dividend_change * 100) / last_two_stats[0].dividend_yield).round(2) if @dividend_change_percent.nil?
  end

  def last_dividend_yield
    stats.last.dividend_yield if @last_dividend_yield.nil?
  end

  def im_index
    if dgr.present?
      ((dgr.dgr_1 + dgr.dgr_3 + dgr.dgr_5 + dgr.dgr_10 + dgr.dgr_10)/5 + dgr.mr_inc + last_dividend_yield**2).round(1)
    else
      0
    end
  end

  private

    def dividend_change
      last_two_stats[0].dividend_yield - last_two_stats[1].dividend_yield
    end
end
