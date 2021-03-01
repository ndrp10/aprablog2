class OrdersController < ApplicationController

    def create
        membership = Membership.find(params[:membership_id])
        order = Order.create!(membership_id: membership.id, membership_name: membership.name, amount: membership.price, state: 'pending', user_id: current_user.id)
        session = Stripe::Checkout::Session.create(
          payment_method_types: ['ideal', 'card'],
          line_items: [{
            name: membership.name,
            amount: membership.price,
            currency: 'eur',
            quantity: 1
          }],
          success_url: order_url(order),
          cancel_url: order_url(order)
        )
      
        order.update(checkout_session_id: session.id)
        redirect_to new_order_payment_path(order)
      end

    def show
        @order = current_user.orders.find(params[:id])
        @user = current_user

        if @order.state == "paid"
          flash[:notice] = "Your membership has been succesfully extended"
          UserMailer.membershipactivated(@user).deliver
        else
          flash[:alert] = "Something went wrong with your order, please try again"
        end
    end

    private

    def euro
      pricestring = @order.amount.to_s
      priceshort = truncate(pricestring, length: 2)
      euro = "#{priceshort}€"
    end
      
end
