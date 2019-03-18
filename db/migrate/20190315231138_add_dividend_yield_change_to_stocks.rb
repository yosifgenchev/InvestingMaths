class AddDividendYieldChangeToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :dividend_yield_change, :decimal
  end
end
