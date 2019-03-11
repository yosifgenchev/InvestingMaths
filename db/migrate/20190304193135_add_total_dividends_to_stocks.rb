class AddTotalDividendsToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :total_dividends, :integer
  end
end
