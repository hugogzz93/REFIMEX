class AddsProductNameToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :product_name, :string
  end
end
