class AddTotalDebtToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :total_debt, :integer
  end
end
