class AddNetIncomeToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :net_income, :integer
  end
end
