require 'rails_helper'

RSpec.feature 'admin creates a user', type: :feature do
	context 'when they input all the data' do
		context 'and the passwords match' do
			scenario 'new user is created' do
				login_as(create(:admin), :scope => :user)
				visit new_user_registration_path

				user = attributes_for :user
				fill_in :user_name, with: user[:name]
				fill_in :user_email, with: user[:email]
				fill_in :user_password, with: user[:password]
				fill_in :user_password_confirmation, with: user[:password]
				choose 'client'

				click_button 'Grabar'
				expect(page).to have_content user[:name]
			end
		end

		context 'and the passwords do not match' do
			scenario 'user is not created' do
				login_as(create(:admin), :scope => :user)
				visit new_user_registration_path

				user = attributes_for :user
				fill_in :user_name, with: user[:name]
				fill_in :user_email, with: user[:email]
				fill_in :user_password, with: user[:password]
				fill_in :user_password_confirmation, with: 'unequal password'
				choose 'client'

				click_button 'Grabar'
				expect(page).not_to have_content user[:name]
			end
		end
	end
end