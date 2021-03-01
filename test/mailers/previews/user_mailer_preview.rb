# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    @user = User.first
    UserMailer.welcome(@user)
  end

  def membershipexpiring
    @user = User.first
    UserMailer.membershipexpiring(@user)
  end

end
