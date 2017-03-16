class RemovesColumnsFromProduct < ActiveRecord::Migration[5.0]
  def change
  	remove_column :products, :base_price, :decimal
  	remove_column :products, :iva, :decimal
  	remove_column :products, :ieps, :decimal
  end
end
