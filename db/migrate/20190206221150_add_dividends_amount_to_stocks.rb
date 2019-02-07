class AddDividendsAmountToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :dividends_amount, :decimal
  end
end
