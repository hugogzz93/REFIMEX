class CreateProductPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :product_prices do |t|
      t.belongs_to :product, index: true, null:false
      t.decimal :fiscal_stimulus, null:false
      t.decimal :diminished_quote, null:false
      t.decimal :final_price, null:false
      t.datetime :active_date, null:false
      t.timestamps
    end
  end
end
