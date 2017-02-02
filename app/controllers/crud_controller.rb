class CrudController < ApplicationController
  before_action :find_model

  def index
    @objects = model.all
  end

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

  def model
    @klass ||= controller_name.singularize.camelize.constantize
  end

  def object_params
    params.require(model.name.underscore.to_sym).permit(model.column_names)
  end

  def find_model
    @object = model.find(params[:id]) if params[:id]
  end
end