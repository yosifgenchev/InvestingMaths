class CreateDividends < ActiveRecord::Migration[5.2]
  def change
    create_table :dividends do |t|
      t.decimal :amount
      t.references :stock, foreign_key: true

      t.timestamps
    end
  end
end
