class Product < ApplicationRecord
  has_many :modifiers
  has_many :users, through: :modifiers

  def price(user)
    (base_price + iva/100 + ieps - discount_for(user)).round 2
  end

  def discount_for(user)
    modifiers.where(user: user).first.ammount.to_f / 100
  end
  
end
