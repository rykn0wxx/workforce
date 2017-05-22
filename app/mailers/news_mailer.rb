class NewsMailer < ApplicationMailer
  default from: 'ariel.andrade@stefanini.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.news_mailer.ondemand.subject
  #
  def ondemand
    @greeting = "Hi"

    mail to: "raurici666@gmail.com", subject: 'Test'
  end
end
