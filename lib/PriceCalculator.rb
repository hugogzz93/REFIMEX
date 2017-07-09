class PriceCalculator
	class << self

		def calculate_cost(price, modifier, units)
			calculate_modified_cost(price_calculation(price, modifier), units)
		end

		def calculate_modified_cost(price, units)
			price*units
		end
		
		def calculate_price(modifier, prod_price)
			begin
				price_calculation(prod_price.price, modifier.ammount.to_f)
			rescue
			end
		end

		def price_calculation(price, modification)
			(price + modification).round(4)
		end
	end
end
