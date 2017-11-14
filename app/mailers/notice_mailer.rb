class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_event.subject
  #
  def sendmail_event(event)
    @event = event  
    @greeting = "こんにちは！ようこそ店舗検索アプリへ"

    mail to: "ny_bigapplejr@yahoo.co.jp",
         subject: '店舗情報が登録されました！！'
  end
end
