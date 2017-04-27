class OrdersController < CrudController
  def index
    @objects = current_user.admin? ? Order.all.order(created_at: :desc) : current_user
      .orders
      .includes([:product, :user])
      .order(created_at: :desc)
  end

  def show
    @object = model.find(params[:id])
  end

  def new
    super
    @product = Product.find(params[:product_id])
    @prices = @product.prices_for current_user
    @pp = @product.active_product_price
    gon.pp = @pp
    gon.discount = current_user.modifier_for(@product)
    gon.chart_data = Modifier.chart_digest( { product_id: @product.id },
                                            { user_id: current_user.id,
                                              product_id: @product.id },
                                            Time.zone.now, "year"
                                          )
  end

  def create
    if model.register_order object_params.merge(user_id: current_user.id)
      ApplicationMailer.order_request(Order.last, current_user).deliver_later
      redirect_to collection_path
    else
      redirect_to collection_path
    end
  end
end
