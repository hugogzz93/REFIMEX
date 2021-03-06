class ProductsController < CrudController
  before_action :permit_if_admin, only: [:edit, :delete, :new]
  def new
    @object = model.new
    @object.product_prices.build
  end

  def edit
    super
    @users = User.all
    @product_prices = @object.product_prices
    gon.chart_data = ProductPrice.chart_digest({product_id: @object.id},
                                               {},
                                               Time.zone.now, "year")
  end

  def tax_history
  	@objects = @object.get_taxes
  end

  private

  def object_params
    super.merge params.require(:product)
                      .permit(product_prices_attributes: [:valid_quote,
                                               :state_quote,
                                               :carbon_tax,
                                               :final_price,
                                               :active_date])
  end
end
