class ProductsController < CrudController
  before_action :permit_if_admin, only: [:edit, :delete, :new]

  def edit
    super
    @users = User.all
  end
end