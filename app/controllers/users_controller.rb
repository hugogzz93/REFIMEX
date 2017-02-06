class UsersController < CrudController
  before_action :protect_user_from_other, except: [:index]

  private

  def protect_user_from_other
    redirect_to collection_path unless current_user.admin? || current_user.id == params[:id]
  end

  def object_params
    if current_user.admin?
      params.require(model.name.underscore.to_sym).permit(model.column_names, 
                                                          :password,
                                                          :password_confirmation)
    else
      params.require(model.name.underscore.to_sym).permit(:name, 
                                                          :email,
                                                          :password,
                                                          :password_confirmation)
    end
  end
end