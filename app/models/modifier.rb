class Modifier < ApplicationRecord
  include Valued
  belongs_to :user
  belongs_to :product
  validates :user_id, :product_id, presence: true
  validate :administrators_cant_have_discounts

  def price
    product.price user
  end

  def administrators_cant_have_discounts
    if user.admin?
      errors.add(:user_id, "must be a client account")
    end
  end


  class << self
    def get_active_modifier_for(user, product)
      where(user_id: user.id, product_id: product.id).order(:created_at).last
    end

    def find_last_or_build_by(params)
      Modifier.where(params).order('created_at').last ||
      Modifier.new(params)
    end

    def object_query(date, time_range, scope)
      ProductPrice.by_date(date, time_range).where(scope)
    end

  	def chart_datasets(objects, options)
      user = User.find(options[:user_id])
      prod = Product.find(options[:product_id])
      modifier = get_active_modifier_for user, prod
  		[{
  		  label: 'Precio/Litro',
  		  data: objects.map {|x| prod.calculate_price(user, modifier, x)},
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
  		}, {
  		  label: 'Impuesto al Carbono',
  		  data: objects.map(&:carbon_tax),
  		  backgroundColor: "rgba(48,168,225,0.5)",
  		  borderColor: "#30A9DE",
  		}]
  	end
  end
end
