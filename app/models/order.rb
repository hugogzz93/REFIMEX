class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def total_cost
    product.price_for(user) * units
  end
end
