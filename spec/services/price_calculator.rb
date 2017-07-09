require 'rails_helper'

RSpec.describe PriceCalculator do
	let(:price) { 5 }
	let(:modifier) { OpenStruct.new(ammount: 0.5) }
	let(:calculator) { PriceCalculator }

	describe '.calculate_cost' do
		context 'given a price, the modifier and units' do
			it 'should calculate a price affected by the modifier applied on the units' do

				expect(calculator.calculate_cost(price, 0.5, 1)).to eq(5.5)
				expect(calculator.calculate_cost(price, 2, 2)).to eq(14)
				expect(calculator.calculate_cost(price, -5, 3)).to eq(0)
				expect(calculator.calculate_cost(price, -6, 4)).to eq(-4)
			end
		end
	end

	describe '.price_calculation' do
		context 'given a price and a modifier' do
			it 'should return the addition of both, rounded to 4 decimals' do
				expect(calculator.price_calculation(4, 0.1234567)).to eq(4.1235)
				expect(calculator.price_calculation(-2.1234, 0.1234)).to eq(-2)
				expect(calculator.price_calculation(0, 0)).to eq(0)
			end
		end
	end
end