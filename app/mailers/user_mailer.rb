class UserMailer < ActionMailer::Base
  default from: "rotten@mangoes.com"

  def welcome_email(user)
    @user = user
    @url = "http://example.com/login"
    mail(to: @user.email, subject: "Welcome To My Awesome Site")
  end

  def delete_email(user)
    @user = user
    @url = "http://0.0.0.0:3000/users/new"
    mail(to: @user.email, subject: "Sad to see you go")
  end
end
