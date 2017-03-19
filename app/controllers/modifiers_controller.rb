class ModifiersController < CrudController
  before_action :permit_if_admin

  def index
    @products = Product.all
  end

  # def update
  #   object = model.find params[:modifier][:id]
  #   if object.update object_params
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  def create
    params[:modifier].extract! 'id'
    super
  end

  def destroy
    redirect_to root_path
    @object.destroy
  end

  def find # MODIFIERS ARE GENERATED HERE
    respond_to do |format|
      format.json do
        render json: Modifier
                     .find_last_or_build_by(user_id:    params[:user_id],
                                             product_id: params[:product_id])
      end
    end
  end

  def collection_path
    root_path
  end
end
