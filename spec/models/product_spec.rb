require 'rails_helper'

RSpec.describe Product, type: :model do
	let(:user) { FactoryGirl.create :user }

	it "should always have a product price"

	describe ".get" do
		
		context "when type is price" do 
			it "should bring all with type price"
		end

		context "when type is tax" do 
			it "should bring all with type tax"
		end

		it "should bring all with type both"
		it "should bring only product prices of the product"
		it "should order them by active date desc"
	end

	describe ".price_for" do 
		before do 
			FactoryGirl.create :modifier, ammount: 5, user: user
			@modifier = FactoryGirl.create :modifier, ammount: 5, user: user
			2.times { FactoryGirl.create :product_price, product: subject }
			@product_price = FactoryGirl.create :product_price, product: subject

		end

		it "should call the correct handler with the correct params" do 
			expect(PriceCalculator).to receive(:calculate_price).with(@modifier, @product_price)
		end
	end

	describe ".modifier_for" do 
		it "should bring the most recent modifier" do
			2.times { FactoryGirl.create :modifier, ammount: 5, user: user }
			@modifier = FactoryGirl.create :modifier, ammount: 5, user: user
			expect(subject.modifier_for user).to eq(@modifier)
		end
	end

	describe '.price' do
		it "should bring the most recent product price, but not a future one" do 
			2.times { FactoryGirl.create :product_price, product: subject, active_date: Time.zone.now - 1.day }
			2.times { FactoryGirl.create :product_price, product: subject, active_date: Time.zone.now + 1.day }
			@product_price = FactoryGirl.create :product_price, product: subject, active_date: Time.zone.now
			expect(subject.price).to eq(@product_price.price)
		end
	end

	describe ".find_or_create_modifier_for" do
		context "when there are no matching modifiers" do 
			before do
				subject.modifiers.destroy_all
			end

			it "should create a new with the given params" do
				expect(product.find_or_create_modifier_for user)
				.to return_an_instance_of(Modifier)
			end
		end

		context ".when there are matching modifiers" do 
			before do
				2.times { FactoryGirl.create :modifier, ammount: 5, user: user }
				@modifier = FactoryGirl.create :modifier, ammount: 5, user: user
			end
			context "and there are multiple matches" do 
				it "should bring the one created most recently" do
					expect(find_or_create_modifier_for user).to eq(@modifier)
				end
			end
		end
	end

	describe ".prices_for" do
		it "should bring a list of prices"
	end

	describe ".users" do
		it "should not repeat users"
	end
end

