require 'will_paginate/array'

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
 
end
