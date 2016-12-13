class UserMailer < ApplicationMailer
	default from: 'notifications@odin-book.com'

	def welcome_email(user)
		@user = user
		@url = 'http://guarded-bastion-44854.herokuapp.com'
		mail(to: @user.email, subject: 'Welcome to Odin-book')
	end
end
