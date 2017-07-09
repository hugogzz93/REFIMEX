class NewProduct
	include Capybara::DSL

	attr_accessor :attributes

	def go_to_form
		visit Rails.application.routes.url_helpers.new_product_path
	end

	def fill_all_fields
		@attributes = FactoryGirl.attributes_for(:product).merge FactoryGirl.attributes_for(:product_price)
		fill_in :product_name, with: attributes[:name]
		fill_in :product_product_prices_attributes_0_valid_quote, with: attributes[:valid_quote]
		fill_in :product_product_prices_attributes_0_carbon_tax, with: attributes[:carbon_tax]
		fill_in :product_product_prices_attributes_0_state_quote, with: attributes[:state_quote]
		fill_in :product_product_prices_attributes_0_final_price, with: attributes[:final_price]
	end

	def fill_some_fields
		@attributes = FactoryGirl.attributes_for(:product).merge FactoryGirl.attributes_for(:product_price)
		fill_in :product_name, with: attributes[:name]
		fill_in :product_product_prices_attributes_0_valid_quote, with: attributes[:valid_quote]
		fill_in :product_product_prices_attributes_0_carbon_tax, with: attributes[:carbon_tax]
		fill_in :product_product_prices_attributes_0_final_price, with: attributes[:final_price]
	end

	def save
		click_button 'Grabar'
	end
end