class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url = 'everybody@appacademy.io'
    mail(to: user.email, subject: 'Welcome to App Academy')
  end

end
