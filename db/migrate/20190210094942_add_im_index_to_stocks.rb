class AddImIndexToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :im_index, :integer
  end
end
