require 'will_paginate/array'
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :student, :education, :field_of_study, :academic_interests, :expectations, :admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :student, :education, :field_of_study, :academic_interests, :expectations, :admin, :premium_until])
  end

    
end
