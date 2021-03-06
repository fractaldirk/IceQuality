class UserMailer < ActionMailer::Base
  default from: "dirkgrandjean@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.comment_confirmation.subject
  #
  def comment_confirmation(employee)
    @employee = employee

    mail(:to => @employee.email,
    :subject => "Auto-uitlaat: Activity log",
    :cc => "pepjansen@hotmail.com, dirkgrandjean@live.nl"
    )
    mail to: @employee.email, subject: "Auto-uitlaat: Activity log"
  end
end
