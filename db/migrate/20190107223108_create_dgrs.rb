class CreateDgrs < ActiveRecord::Migration[5.2]
  def change
    create_table :dgrs do |t|
      t.integer :dgr_1
      t.integer :dgr_3
      t.integer :dgr_5
      t.integer :dgr_10
      t.integer :mr_inc
      t.references :stock, foreign_key: true

      t.timestamps
    end
  end
end
