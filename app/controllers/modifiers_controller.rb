class ModifiersController < CrudController
  before_action :permit_if_admin
  
  def find_model
    if params[:modifier][:id]
      @object = model.find(params[:modifier][:id])
    elsif params[:id]
      @object = model.find(params[:id])
    end
  end
end