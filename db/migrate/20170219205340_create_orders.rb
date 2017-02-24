class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.float :units, default: 0, null: false
      t.belongs_to :user, index: true, null: false
      t.belongs_to :product, index: true, null: false
      t.text :description

      t.timestamps
    end
  end
end
