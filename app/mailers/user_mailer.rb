class UserMailer < ApplicationMailer
	  default from: "danielrollings@mac.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'your-email@example.com',
        :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
  @appname = "Rollings Roastery"
  mail( :to => user.email,
        :subject => "Welcome to #{@appname}!")
  end

  def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  UserMailer.contact_form(@email, @name, @message).deliver_now
	end

  def paid_success(user, product)
    @user = user
    @product = product
    mail(
      :from => 'danielrollings@mac.com',
      :to => @user.email,
      :subject => "Roasting with the Rollings': Order and Payment confirmation"
      )
  end
end
