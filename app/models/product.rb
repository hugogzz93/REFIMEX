class Product < ApplicationRecord
  has_many :modifiers
  has_many :users, through: :modifiers

  def price(user)
    base_price + iva + ieps - user.discount
  end

  def iva
    base_price * 0.16
  end

  def ieps
    4.73
  end
  
end
