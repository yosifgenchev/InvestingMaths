class AddSectorToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :sector, :string
  end
end
