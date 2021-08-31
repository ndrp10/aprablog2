class StripeCheckoutSessionIncrementPremiumService
    def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    user = User.find(order.user_id)
    user.increment_premium
    user.save
    end
end