class PaymentsController < ApplicationController

    
        def new
          @order = current_user.orders.where(state: 'pending').find(params[:order_id])

          if @order.membership_name == 'Student'
            @price = '10.00€'

          else
            @price = '20.00€'
          end

        end


        

       
      
end
