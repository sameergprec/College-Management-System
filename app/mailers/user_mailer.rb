class UserMailer < ApplicationMailer
  default from: 'ADMINISTRATION <donotreply.rorec@gmail.com>'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to ROREC')
  end

  def password_reset(user)
    @user = user
    mail(to: @user.email, subject: 'Reset Your Password')
  end

  def account_created(user)
    @user = user
    mail(to: @user.email, subject: 'Your Account has been Created')
  end
end
