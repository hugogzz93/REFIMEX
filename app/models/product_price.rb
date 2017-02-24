class ProductPrice < ApplicationRecord
  belongs_to :product
  include Valued

  def price
    final_price
  end

  # Valued Interface
  def labels_helper
    active_date.strftime('%d/%m')
  end

  class << self
    def chart_datasets(objects)
      [{
        label: 'Price',
        data: objects.map(&:price),
        backgroundColor: "rgba(220,220,220,0)",
        borderColor: "#519D9E",
      }, {
        label: 'Diminished Quote',
        data: objects.map(&:diminished_quote),
        backgroundColor: "rgba(220,220,220,0)",
        borderColor: "#E53A40",
      }, {
        label: 'Fiscal Stimulus',
        data: objects.map(&:fiscal_stimulus),
        backgroundColor: "rgba(220,220,220,0)",
        borderColor: "#30A9DE",
      }]
    end
  end
end
