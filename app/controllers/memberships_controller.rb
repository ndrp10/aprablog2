class MembershipsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]

    def index
        if user_signed_in? && current_user.student

          @membership = Membership.where(name: 'Student')

        elsif user_signed_in?

          @membership = Membership.where(name: 'Regular')

        else
          redirect_to new_user_session_path
        end
    end
    
    def show
      if user_signed_in? && current_user.student
        
        @membership = Membership.where(name: 'Student')
        @price = '10.00€'

      elsif user_signed_in?

        @membership = Membership.where(name: 'Regular')
        @price = '20.00€'

    end
  end
end
   

   



