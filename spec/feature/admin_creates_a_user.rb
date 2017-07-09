require 'rails_helper'

RSpec.feature 'admin creates a user', type: :feature do
	let(:new_user) { NewUser.new }

	context 'when they input all the data' do
		context 'and the passwords match' do
			scenario 'new user is created' do
				login_as(create(:admin), :scope => :user)

				new_user.go_to_form
				new_user.fill_form_correctly
				new_user.save

				expect(page).to have_content new_user.attributes[:name]
			end
		end

		context 'and the passwords do not match' do
			scenario 'user is not created' do
				login_as(create(:admin), :scope => :user)
				
				new_user.go_to_form
				new_user.fill_form_correctly
				new_user.save

				expect(page).not_to have_content new_user.attributes[:name]
			end
		end
	end
end