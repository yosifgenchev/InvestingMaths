class ChangeNumericFieldInMyTable < ActiveRecord::Migration[5.2]
  def self.up
  	    remove_column :stocks, :dividend_yield_change

  end
   def self.down
   	    add_column :stocks, :dividend_yield_change, :decimal, :precision => 8, :scale => 2

  end
end
