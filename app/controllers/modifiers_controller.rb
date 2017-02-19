class ModifiersController < CrudController
  before_action :permit_if_admin

  def create # NOT ACTUALLY NEW, IT ONLY UPDATES
    object = model.find params[:modifier][:id]
    if object.update object_params
      redirect_to root_path
    else
      render :edit
    end
  end

  def find # MODIFIERS ARE GENERATED HERE
    respond_to do |format|
      format.json {
        render json: Modifier.find_or_create_by(user_id:    params[:user_id],
                                                product_id: params[:product_id])
      }
    end
  end
end