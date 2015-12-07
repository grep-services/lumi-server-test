class UserMailer < ApplicationMailer
  default from: "atsmucha@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  #en.user_mailer.activation_need_email.
  def activation_needed_email(user)
    @user = user
    @url = "http://0.0.0.0:3000/users/#{user.activation_token}/activate"
    mail(:to => user.email,
       :subject => "Welcome to My Awesome Site")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  #   en.user_mailer.activation_success_email.subject
  def activation_success_email(user)
    @user = user
    @url  = "http://0.0.0.0:3000/login"
    mail(:to => user.email,
       :subject => "Your account is now activated")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  def reset_password_email(user)
    @user = User.find user.id
      @url = "http://0.0.0.0:3000/" + edit_password_reset_path(@user.reset_password_token)
      mail(:to => user.email,  :subject => "Your password has been reset")
  end
end     #UserMailer
