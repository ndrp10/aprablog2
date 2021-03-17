require 'will_paginate/array'

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    @user = User.last

    if @user.student
      @membership = @membership = Membership.where(name: 'Student')
      stored_location_for(resource) || membership_path(@membership)
    else 
      @membership = @membership = Membership.where(name: 'Regular')
      stored_location_for(resource) || membership_path(@membership)
    end
    
  end


end
