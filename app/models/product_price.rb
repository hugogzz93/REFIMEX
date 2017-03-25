class ProductPrice < ApplicationRecord
  include Valued
  belongs_to :product
  validate :active_date_cannot_be_in_the_past
  validates :active_date, :valid_quote, :state_quote, :carbon_tax, :final_price, 
            presence: true

  enum change_type: [:both, :tax, :price]

  before_save :set_change_type
  default_scope { order(active_date: :desc, created_at: :desc) }


  def set_change_type
    tax_change = false
    price_change = false
    previous_price = product.active_product_price
    if !new_record?
      tax_attributes.each do |f|
        tax_change = true if self.send("#{f}_changed?")
      end
      price_change = true if self.final_price_changed?
      self.change_type = determine_change_type(tax_change, price_change)
    elsif previous_price
      tax_attributes.each do |f|
        tax_change = true if self.send("#{f}") != 
                             previous_price.send("#{f}")
      end
      price_change = true if self.final_price != previous_price.final_price
      self.change_type = determine_change_type(tax_change, price_change)
    else
      self.change_type = :both
    end
  end

  def tax_attributes
    ['valid_quote', 'state_quote', 'carbon_tax']
  end

  def determine_change_type(tax_change, price_change)
    if tax_change && price_change ||
      !tax_change && !price_change ||
      tax_change && price? ||
      price_change && tax? ||
      both?
      :both
    elsif tax_change
      :tax
    else
      :price
    end
  end

  def active_date_cannot_be_in_the_past
    if new_record? && product.active_product_price && active_date < product.active_product_price.active_date
      errors.add(:active_date, "can't be in the past")
    end
  end
  
  def price
    final_price
  end

  # Valued Interface
  def labels_helper
    active_date.strftime('%d/%m')
  end

  class << self
    def chart_datasets(objects, options)
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
