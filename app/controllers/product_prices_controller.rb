class ProductPricesController < CrudController
  def new
    super
    @parent = Product.find params[:product_id]
  end

  def create
    if model.create object_params
      redirect_to parent_path
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

  def parent_path(parent = model.last.product)
    edit_product_path parent
  end
end
