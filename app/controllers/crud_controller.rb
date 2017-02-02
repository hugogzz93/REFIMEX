class CrudController < ApplicationController
  before_action :get_object, only: [:show, :update, :destroy]

  def new
    @object = model.new
  end

  def create
    model.create object_params
  end

  def show
  end

  def update
    @object.update object_params
  end

  def destroy
    @object.destroy
  end

  private

  def get_object
    @object = model.find params[:id]
  end

  def model
    @klass ||= controller_name.singularize.camelize.constantize
  end

  def object_params
    params.require(model.name.underscore.to_sym).permit(model.column_names)
  end
end