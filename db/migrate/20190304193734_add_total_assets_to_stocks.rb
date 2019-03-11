class AddTotalAssetsToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :total_assets, :integer
  end
end
