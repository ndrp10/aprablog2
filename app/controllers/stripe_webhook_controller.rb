require 'json'
require 'create_subscripton_record'
require 'activate_subscription'
require 'create_transaction_record'
require 'send_payment_succeeded_mail'
require 'send_payment_failed_mail'

class StripeWebhookController < ApplicationController
  def stripe

    response = JSON.parse(request.body.read)
    data_object = response["object"]

    case response["type"]
    when "customer.subscription.created"
      create_subscripton = CreateSubscriptionRecord.new.call(data_object)
      return head :ok if create_subscripton.success?
    when "invoice.payment_succeeded"

      subscription = Subscription.find_by(stripe_id: data_object["subscription"])

      ActivateSubscription.new.call(subscription) unless subscription.active?

      create_transaction = CreateTransactionRecord.new.call(data_object)

      send_mail_notification = SendPaymentSucceededMail.new.call(data_object)

        return head :ok if create_transaction.success? && send_mail_notification.success?
        when "invoice.payment_failed"

      subscription = Subscription.find_by(stripe_id: data_object["subscription"])
      send_mail_notification = SendPaymentFailedMail.new.call(subscription)

      return head :ok if send_mail_notification.success?
    end
  end
end