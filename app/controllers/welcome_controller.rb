class WelcomeController < ApplicationController
	layout "frontpage", only: [:frontpage]
	skip_before_action :authenticate_user!, only: [:frontpage]

  def index
    @products = Product.all
  end

  def frontpage
  end
end
