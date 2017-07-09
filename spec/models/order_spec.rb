require 'rails_helper'

RSpec.describe Order, type: :model do


	describe '.positive_unit_count' do
		context 'when the order units are positive' do
			before do
				@order = build :order, units: 1
			end
			it 'should be valid' do
				expect(@order).to be_valid
			end
		end

		context 'when the order units are negative' do
			before do
				@order = build :order, units: -1
			end

			it 'shold be invalid' do
				expect(@order).not_to be_valid
			end
		end

		context 'when the order units are zero' do
			before do
				@order = build :order, units: 0
			end

			it 'shold be invalid' do
				expect(@order).not_to be_valid
			end
		end
	end

	describe ".register_order" do
		# context 'when the product does not exist'

		# end
		context 'when the product does exist' do
			before do
				@price = create :product_price
				@modifier = create :modifier, product: @price.product
				@params = (build :order, product: @price.product, user: @modifier.user).attributes.symbolize_keys
				@order = Order.register_order @params
			end
			it 'should save the price state' do
				expect_any_instance_of(Order).to receive(:set_price_state).and_call_original
				Order.register_order @params
			end

			it 'should return an order' do
				expect(@order.class).to eq(Order)
			end

			it 'should be saved in database' do
				expect(Order.exists?(@order.id)).to be true
			end
		end
	end

	describe '#set_price_state' do
		before do
			@price = create :product_price
			@modifier = build :modifier, product: @price.product
			@order = Order.new
			@order.set_price_state(@price, @modifier)
		end

		it 'should set the price attributes on order' do
			expect(@order).to have_attributes(valid_quote: @price.valid_quote,
																				state_quote: @price.state_quote,
																				carbon_tax: @price.carbon_tax)
		end

		it 'should set the discount' do
			expect(@order.discount).to eq(@modifier.ammount)
		end

		it 'should adjust the price with the modifier' do
			expect(PriceCalculator).to receive(:calculate_price)
			@order.set_price_state(@price, @modifier)
		end
	end

# 	describe "order staticity" do
# 		context "when the product changes price" do
# 			it "should have the same price as the one at the time of creation"
# 		end

# 		context "when the user's discount changes" do
# 			it "should have the same discount as the one at the time of creation"
# 		end
# end
	end