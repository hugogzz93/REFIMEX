class WelcomeController < ApplicationController
	layout "frontpage", only: [:frontpage]
	skip_before_action :authenticate_user!, only: [:frontpage]

  def index
    @products = current_user.admin? ? Product.all : current_user.products
  end

  def frontpage
  end
end
