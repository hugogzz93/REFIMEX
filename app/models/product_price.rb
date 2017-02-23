class ProductPrice < ApplicationRecord
  belongs_to :product
  include Valued

  def price
    final_price
  end

  def label 
    "Final Price"
  end

  def labels_helper
    self.active_date.strftime("%d/%m")
  end
end
