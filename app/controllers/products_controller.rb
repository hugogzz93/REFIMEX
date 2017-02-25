class ProductsController < CrudController
  before_action :permit_if_admin, only: [:edit, :delete, :new]
  def new
    @object = model.new
    @object.product_prices.build
  end

  def edit
    super
    @product_prices = @object.product_prices.order(active_date: :desc)
    @users = User.all
    gon.clear
    gon.chart_data = ProductPrice.chart_digest({product_id: @object.id}, Time.zone.now, "month")
  end
end
