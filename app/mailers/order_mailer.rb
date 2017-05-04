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
		mail(to: User.admin.first.email, subject: 'Order Request')
	end
end
