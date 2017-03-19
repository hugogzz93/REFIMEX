class OrdersController < CrudController
  def index
    @objects = current_user.admin? ? Order.all : current_user
      .orders
      .includes([:product, :user])
  end

  def show
    @object = model.find(params[:id])
  end

  def new
    super
    @product = Product.find(params[:product_id])
    gon.chart_data = Modifier.chart_digest( { product_id: @product.id },
                                            { user_id: current_user.id },
                                            Time.zone.now, "year"
                                            )
  end

  def create
    if model.create object_params.merge(user_id: current_user.id)
      redirect_to collection_path
    else
      render :new
    end
  end
end
