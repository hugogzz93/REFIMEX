require 'rails_helper'

RSpec.feature "admin destroys a user's spec", type: :feature do
	let(:modifier) { create :modifier }
	let(:product) { modifier.product }
	let(:delete_modifier) { DeleteModifier.new(product) }
	let(:user) { modifier.user }

	context 'when the user has one modifier' do
		context 'and the admin deletes the modifier' do
			before do
				login_as(create(:admin), scope: :user)
				delete_modifier.go_to_delete_form
				delete_modifier.delete_modifiers
			end

			it "the user shouldn't see the product avaiable" do
				login_as(user, scope: :user)
				delete_modifier.go_to_product_index
				expect(page).not_to have_content product.name
			end
		end
	end

	context 'when the user has many modifiers for that product' do
		context 'and the admin deletes the modifier' do
			before do
				5.times { create :modifier, product: product, user: user }
				login_as(create(:admin), scope: :user)
				delete_modifier.go_to_delete_form
				delete_modifier.delete_modifiers
			end
			it "the user shouldn't see the product avaiable" do
				login_as(user, scope: :user)
				delete_modifier.go_to_product_index
				expect(page).not_to have_content product.name
			end
		end
	end
end