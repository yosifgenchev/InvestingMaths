class AddDividendYieldLastToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :dividend_yield_last, :decimal
  end
end
