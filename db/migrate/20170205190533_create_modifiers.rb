class CreateModifiers < ActiveRecord::Migration[5.0]
  def change
    create_table :modifiers do |t|
      t.decimal :ammount, null: false, default: 0
      t.belongs_to :user, index: true
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
