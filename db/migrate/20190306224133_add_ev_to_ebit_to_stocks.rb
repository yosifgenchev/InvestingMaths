class AddEvToEbitToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :ev_to_ebit, :decimal
  end
end
