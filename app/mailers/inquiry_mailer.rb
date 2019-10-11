class InquiryMailer < ApplicationMailer
  default to: "takuma0920ozk@gmail.com"

  def received_email(inquiry)
    mail_subject = "お問い合わせフォームからお問い合わせがありました"

    @inquiry = inquiry
    mail(
      :from => @inquiry.email,
      :subject => mail_subject)

  end
end
