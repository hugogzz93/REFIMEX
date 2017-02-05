class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.decimal :base_price
      t.decimal :iva
      t.decimal :ieps
      t.string :name

      t.timestamps
    end
  end
end
