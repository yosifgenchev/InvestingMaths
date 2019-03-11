class AddTotalLiabilitiesToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :total_liabilities, :integer
  end
end
