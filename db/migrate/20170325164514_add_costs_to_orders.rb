class AddCostsToOrders < ActiveRecord::Migration[5.0]
  def change
  	add_column :orders, :valid_quote, :decimal, null: false
  	add_column :orders, :state_quote, :decimal, null: false
  	add_column :orders, :carbon_tax, :decimal, null: false
  	add_column :orders, :discount, :decimal, null: false
  	add_column :orders, :price, :decimal, null: false
  end
end
