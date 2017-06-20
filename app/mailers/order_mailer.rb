class OrderMailer < ApplicationMailer
	default to: Proc.new { User.admin.pluck(:email) },
	          from: 'refinadosmx@gmail.com'

	def order_confirmation_mail(user)
		# @user = user
		# mail(to: @user.email, subject: 'Order Confirmation')
	end

	def order_request(order, user)
		@order = order
		@user = user
		mail(to: 'refinados@prodigy.net.mx', subject: 'Order Request')
	end

	def price_update(user, product)
		@user = user
		@product = product
		mail(to: user.email, subject: "Precio de #{@product.active_product_price.created_at.strftime("%b %d, %Y")}")

	end
end
