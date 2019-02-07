class AddEarningsAmountToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :earnings_amount, :decimal
  end
end
