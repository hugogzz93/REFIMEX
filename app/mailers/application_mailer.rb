class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  def order_confirmation_mail(user)
  	@user = user
  	mail(to: @user.email, subject: 'Order Confirmation')
  end

  def order_request(order, user)
  	@order = order
  	@user = user
  end
end
