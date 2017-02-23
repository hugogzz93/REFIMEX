class Product < ApplicationRecord
  has_many :modifiers, dependent: :destroy
  has_many :users, through: :modifiers
  has_many :product_prices, dependent: :destroy


  def price_for(user)
      (price - discount_for(user)).round 2
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

  def price
    active_product_price.price
  end

  def active_product_price
    product_prices.where("active_date <= :now", now: Time.zone.now).last
  end
end
