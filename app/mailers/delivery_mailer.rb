class DeliveryMailer < ActionMailer::Base
  default from: "no-reply@geretps.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.delivery_mailer.new_record_notification.subject
  #
  def new_record_notification(mail_target,subject,delivery)
    @delivery = delivery
    mail to: mail_target, subject: subject
  end
end
