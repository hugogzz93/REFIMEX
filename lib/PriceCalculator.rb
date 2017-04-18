class PriceCalculator
	class << self

		def calculate_cost(price, modifier, units)
			calculate_discounted_cost(price_calculation(price, modifier), units)
		end

		def calculate_discounted_cost(price, units)
			price*units
		end
		
		def calculate_price(modifier, prod_price)
			begin
				price_calculation(prod_price.price, modifier.ammount.to_f)
			rescue
			end
		end

		def price_calculation(price, discount)
			(price - discount).round(2)
		end

	end
end