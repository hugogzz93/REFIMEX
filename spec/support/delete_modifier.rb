class DeleteModifier
	include Capybara::DSL

	def initialize(product)
		@product = product
	end

	def go_to_delete_form
		visit Rails.application.routes.url_helpers.welcome_index_path
	end
		
	def go_to_product_index
		Product.where.not(id: @product.id).destroy_all
		visit Rails.application.routes.url_helpers.welcome_index_path
	end

	def delete_modifiers
		click_link 'Borrar'
	end
end