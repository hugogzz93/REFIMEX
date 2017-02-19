class WelcomeController < ApplicationController
  def index
    @products = Product.all.includes(:users)
  end

end