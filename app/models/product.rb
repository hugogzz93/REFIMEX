class Product < ApplicationRecord
  has_many :modifiers, dependent: :destroy
  has_many :users, through: :modifiers
  has_many :product_prices, inverse_of: :product, dependent: :destroy

  accepts_nested_attributes_for :product_prices

  def get_taxes
  	get :tax
  end

  def get_prices
  	get :price	
  end

  def get(change_type)
  	product_prices.where(change_type: change_type)
  								.or(product_prices.where(change_type: :both))
  								.order(active_date: :desc)
  end

  def price_for(user)
      begin
        calculate_price(user, modifier_for(user), active_product_price)
      rescue
      end
  end

  def calculate_price(user, modifier, prod_price)
    (prod_price.price - modifier.ammount.to_f).round 2
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
    begin
      active_product_price.price
    rescue
    end
  end

  def prices_for(user)
    prices = product_prices.order(active_date: :desc)
    modifier = Modifier.get_active_modifier_for user, self
    prices.each {|p| p.final_price = calculate_price(user, modifier, p)}
    prices
  end

  def active_product_price
    product_prices.where('active_date <= :now', now: Time.zone.now).last
  end

  def users
    User.where(products: {id: self.id}).joins(modifiers: :product).distinct
  end
end
