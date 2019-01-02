class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.decimal :dividend_yield
      t.decimal :current_price
      t.integer :drip_years_count
      t.references :stock, foreign_key: true

      t.timestamps
    end
  end
end
