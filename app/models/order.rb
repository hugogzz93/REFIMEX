require 'PriceCalculator'
class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validate :positive_unit_count
  enum status: [:unconfirmed, :confirmed]

  before_create :set_product_name

  def set_product_name
    product_name = product.name
  end

  def positive_unit_count
    errors.add :units, "Unit count must be positive." unless units > 0
  end

  def total_cost
    PriceCalculator.calculate_modified_cost(self.price, units)
  end

  def set_price_state(product_price, modifier)
  	self.valid_quote = product_price.valid_quote
  	self.state_quote = product_price.state_quote
  	self.carbon_tax = product_price.carbon_tax
    self.price = PriceCalculator.calculate_price(modifier, product_price)
    self.discount = modifier.ammount
  end
  
  class << self
    def register_order(params)
      product = Product.find(params[:product_id])
      product_price = product.active_product_price
      order = self.new params
  		order.set_price_state(product_price,
  													User.find(params[:user_id]).modifier_for(product))
  		order.save
      order
  	end
  end

end
