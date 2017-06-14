class OrderMailerPreview < ActionMailer::Preview
	def price_update
		OrderMailer.price_update(Product.first, Product.first.users.first)
	end
end