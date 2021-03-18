class ConfirmationsController < Devise::ConfirmationsController
    private
    def after_confirmation_path_for(resource_name, resource)
      sign_in(resource) # In case you want to sign in the user
      @user = current_user

      if @user.student
        @membership = @membership = Membership.where(name: 'Student')
        stored_location_for(resource) || membership_path(@membership)
      else 
        @membership = @membership = Membership.where(name: 'Regular')
        stored_location_for(resource) || membership_path(@membership)
      end
      
    end
  end