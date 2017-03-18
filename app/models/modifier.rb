class Modifier < ApplicationRecord
  belongs_to :user
  belongs_to :product
  include Valued

  def price
    product.price user
  end
end
