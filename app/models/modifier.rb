class Modifier < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def price
    product.price user
  end
end
