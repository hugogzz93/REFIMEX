class ChangesProductPriceSchema < ActiveRecord::Migration[5.0]
  def change
  	remove_column :product_prices, :fiscal_stimulus, :decimal
  	remove_column :product_prices, :diminished_quote, :decimal

  	add_column :product_prices, :valid_quote, :decimal, null: false
  	add_column :product_prices, :state_quote, :decimal, null: false
  	add_column :product_prices, :carbon_tax, :decimal, null: false
  end
end
