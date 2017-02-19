class Product < ApplicationRecord
  has_many :modifiers, dependent: :destroy
  has_many :users, through: :modifiers

  def price_for(user)
      (base_price + iva/100 + ieps - discount_for(user)).round 2
  end

  def discount_for(user)
    begin
      modifier_for(user).ammount.to_f / 100
    rescue 
      0
    end
  end

  def modifier_for(user)
    modifiers.find_by(user: user)
  end
end
