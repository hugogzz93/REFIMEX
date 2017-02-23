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
    # @object_data = @objects.map { |x| x.class.chart_digest(Time.zone.now, "month") }
    
    # gon.objects = @objects.map { |x| x.class.name.downcase }
    # gon.object_data = @object_data
  end
end