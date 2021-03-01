class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = User.last
    mail(to: @user.email, subject: "Welcome to APRA Foundation")
  end

  def membershipexpiring(user)
    @user = user 
    mail(to: @user.email, subject: "APRA Membership is about to expire") 
  end

  def membershipactivated(user)
    @user = user 
    mail(to: @user.email, subject: "Thank you for subscribing")
  end



  
end
