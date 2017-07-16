class NewUser
	include Capybara::DSL
	
	attr_accessor :attributes
	def go_to_form
		visit Rails.application.routes.url_helpers.new_user_registration_path
	end

	def fill_form_correctly
		@attributes = FactoryGirl.attributes_for :user
		fill_in :user_name, with: attributes[:name]
		fill_in :user_email, with: attributes[:email]
		fill_in :user_password, with: attributes[:password]
		fill_in :user_password_confirmation, with: attributes[:password]
		choose 'client'
	end

	def fill_form_with_mismatched_passwords
		@attributes = FactoryGirl.attributes_for :user
		fill_in :user_name, with: attributes[:name]
		fill_in :user_email, with: attributes[:email]
		fill_in :user_password, with: attributes[:password]
		fill_in :user_password_confirmation, with: 'invalid password'
		choose 'client'
	end

	def save
		click_button 'Grabar'
	end
end