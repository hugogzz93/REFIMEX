class ProductPrice < ApplicationRecord
  belongs_to :product
  validate :active_date_cannot_be_in_the_past
  include Valued

  def price
    final_price
  end

  def active_date_cannot_be_in_the_past
    if active_date < Time.zone.now
      errors.add(:active_date, "can't be in the past")
    end
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
        label: 'Cuota IEPS Vigente',
        data: objects.map(&:valid_quote),
        backgroundColor: "rgba(229,58,64,0.3)",
        borderColor: "#E53A40",
      }, {
        label: 'IEPS Municipio y Estado',
        data: objects.map(&:state_quote),
        backgroundColor: "rgba(48,168,222,0.5)",
        borderColor: "#30A9DE",
      },{
        label: 'Impuesto al Carbono',
        data: objects.map(&:carbon_tax),
        backgroundColor: "rgba(48,168,222,0.5)",
        borderColor: "#30A9DE",
      }]
    end
  end
end
