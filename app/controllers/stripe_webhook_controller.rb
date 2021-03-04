require 'json'
require 'create_transaction_record'
require 'send_payment_succeeded_mail'
require 'send_payment_failed_mail'

class StripeWebhookController < ApplicationController
  def stripe

    response = JSON.parse(request.body.read)
    data_object = response["object"]

    case response["type"]
    when "checkout.session.completed"
  
      create_transaction = CreateTransactionRecord.new.call(data_object)

      send_mail_notification = SendPaymentSucceededMail.new.call(data_object)

      return head :ok if create_transaction.success? && send_mail_notification.success?

    else
      send_mail_notification = SendPaymentFailedMail.new.call(data_object)
      return head :ok if send_mail_notification.success?
    end
  end
end