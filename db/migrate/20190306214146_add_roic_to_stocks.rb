class AddRoicToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :roic, :decimal
  end
end
