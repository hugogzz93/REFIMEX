require 'rails_helper'

RSpec.feature 'admin creates a product', type: :feature do 
	context 'they have all values filled' do
		scenario 'they see the product form' do
			login_as(create(:admin), :scope => :user)
			new_product = NewProduct.new

			new_product.go_to_form
			new_product.fill_all_fields
			new_product.save

			expect(page).to have_content new_product.attributes[:name]
		end
	end

	context 'they are missing values' do
		scenario 'they see the product form' do
			login_as(create(:admin), :scope => :user)
			new_product = NewProduct.new

			new_product.go_to_form
			new_product.fill_some_fields
			new_product.save

			expect(page).not_to have_content new_product.attributes[:name]
		end
	end
end