class ProductsController < CrudController
  before_action :permit_if_admin, only: [:edit, :delete, :new]
  def new
    @object = model.new
    @object.product_prices.build
  end

  def edit
    super
    @users = User.all
  end
end