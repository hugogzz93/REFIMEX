class ProductsController < CrudController
  before_action :allow_admin, only: [:edit, :delete, :new, :index]

  def edit
    super
    @users = User.all
  end
end