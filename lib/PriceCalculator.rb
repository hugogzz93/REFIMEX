class PriceCalculator
	class << self
		
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