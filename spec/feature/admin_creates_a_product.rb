require 'rails_helper'

RSpec.feature 'admin creates a product', type: :feature do 
	context 'they have all values filled' do
		scenario 'they see the product form' do
			login_as(create(:admin), :scope => :user)
			visit new_product_path

			attributes = attributes_for(:product).merge attributes_for(:product_price)
			fill_in :product_name, with: attributes[:name]
			fill_in :product_product_prices_attributes_0_valid_quote, with: attributes[:valid_quote]
			fill_in :product_product_prices_attributes_0_carbon_tax, with: attributes[:carbon_tax]
			fill_in :product_product_prices_attributes_0_state_quote, with: attributes[:state_quote]
			fill_in :product_product_prices_attributes_0_final_price, with: attributes[:final_price]

			click_button 'Grabar'
			expect(page).to have_content attributes[:name]
		end
	end

	context 'they are missing values' do
		scenario 'they see the product form' do
			login_as(create(:admin), :scope => :user)
			visit new_product_path

			attributes = attributes_for(:product).merge attributes_for(:product_price)
			fill_in :product_name, with: attributes[:name]
			fill_in :product_product_prices_attributes_0_carbon_tax, with: attributes[:carbon_tax]
			fill_in :product_product_prices_attributes_0_state_quote, with: attributes[:state_quote]
			fill_in :product_product_prices_attributes_0_final_price, with: attributes[:final_price]

			click_button 'Grabar'
			expect(page).not_to have_content attributes[:name]
		end
	end
end