class AddChangeType < ActiveRecord::Migration[5.0]
  def change
  	add_column :product_prices, :change_type, :integer
  end
end
