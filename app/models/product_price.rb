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
        label: 'Precio/Litro',
        data: objects.map(&:price),
        backgroundColor: "rgba(81, 157, 178,0.1)",
        borderColor: "#519D9E",
      }, {
        label: 'Quota Disminuida',
        data: objects.map(&:diminished_quote),
        backgroundColor: "rgba(229,58,64,0.3)",
        borderColor: "#E53A40",
      }, {
        label: 'Estímulo Fiscal',
        data: objects.map(&:fiscal_stimulus),
        backgroundColor: "rgba(48,168,222,0.5)",
        borderColor: "#30A9DE",
      }]
    end
  end
end
