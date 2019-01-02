class AddIndustryToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :industry, :string
  end
end
