class CreateEarnings < ActiveRecord::Migration[5.2]
  def change
    create_table :earnings do |t|
      t.decimal :actualEPS
      t.references :stock, foreign_key: true

      t.timestamps
    end
  end
end
