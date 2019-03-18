class AddAgainDividendYieldChangeToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :dividend_yield_change, :decimal, :precision => 10, :scale => 2
  end
end
