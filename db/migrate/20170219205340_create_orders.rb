class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.float :units
      t.belongs_to :user, index: true
      t.belongs_to :product, index: true
      t.text :description

      t.timestamps
    end
  end
end
