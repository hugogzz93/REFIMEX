class ProductsController < CrudController
  before_action :check_if_admin, only: [:edit, :delete, :new]
end