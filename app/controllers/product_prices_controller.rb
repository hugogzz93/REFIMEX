class ProductPricesController < CrudController
  def new
    super
    @parent = Product.find params[:product_id]
  end

  def create
    params[:product_price][:active_date] = Time.zone
                                          .parse(params[:product_price][:active_date])
    if model.create object_params
      redirect_to parent_path(Product.find(object_params[:product_id]))
    else
      render :new
    end
  end

  def destroy
    redirect_to parent_path @object.product
    @object.destroy
  end

  def tax_index
    products = Product.all
    @objects = products.all.collect do |x|
      x.product_prices
       .where('active_date <= :now', now: Time.zone.now)
       .order('active_date')
       .last
    end
  end

  private

  def parent_path(parent = model.all.order('created_at').last.product)
    debugger
    edit_product_path parent
  end
end
