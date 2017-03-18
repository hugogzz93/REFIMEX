class Product < ApplicationRecord
  has_many :modifiers, dependent: :destroy
  has_many :users, through: :modifiers
  has_many :product_prices, inverse_of: :product, dependent: :destroy

  accepts_nested_attributes_for :product_prices

  def price_for(user)
      (price - discount_for(user)).round 2
  end

  def discount_for(user)
    modifier_for(user).ammount.to_f
  rescue
    0
  end

  def modifier_for(user)
    modifiers.where(user: user).last
  end

  def price
    active_product_price.price
  end

  # def fiscal_stimulus
  #   active_product_price.fiscal_stimulus
  # end

  # def diminished_quote
  #   active_product_price.diminished_quote
  # end

  def active_product_price
    product_prices.where('active_date <= :now', now: Time.zone.now).last
  end

  def users
    User.where(products: {id: self.id}).joins(modifiers: :product).distinct
  end
end
