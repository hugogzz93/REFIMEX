require 'PriceCalculator'
class Product < ApplicationRecord
  has_many :modifiers, dependent: :destroy
  has_many :users, through: :modifiers
  has_many :product_prices, inverse_of: :product, dependent: :destroy
  has_many :orders
  after_create :set_price_time_to_start_of_day

  accepts_nested_attributes_for :product_prices

  def set_price_time_to_start_of_day
    if product_prices.any?
      pp = product_prices.first
      pp.update(active_date: pp.active_date.beginning_of_day)
    end
  end

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
    PriceCalculator.calculate_price(modifier_for(user),
                                    active_product_price)
  end

  def discount_for(user)
    modifier_for(user).ammount.to_f
  rescue
    0
  end

  def modifier_for(user)
    user.modifiers.find_by(product_id: self.id)
  end

  def price
    begin
      active_product_price.price
    rescue
    end
  end

  def price_updated?
    product_prices
          .where(active_date: Time.zone.now.method("beginning_of_day").call..
                              Time.zone.now.method("end_of_day").call).any?
  end

  def find_or_create_modifier_for(user)
    modifier = Modifier.order('created_at desc')
                       .where(product_id: self.id, user_id: user.id)
                       .first
    modifier ||= self.modifiers.create user_id: user.id
  end

  def prices_for(user)
    prices = product_prices
    modifier = user.modifier_for self
    prices.each {|p| p.final_price = PriceCalculator.calculate_price(modifier,
                                                                     p)}
    prices
  end

  def active_product_price
    product_prices.where('active_date <= :now', now: Time.zone.now)
                  .order(active_date: :desc, created_at: :desc)
                  .first
  end

  def users
    User.where(products: {id: self.id}).joins(modifiers: :product).distinct
  end
end
