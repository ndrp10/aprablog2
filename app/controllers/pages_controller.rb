class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :getmembership, :contactus, :coreprinciples, :organization]

  def home
    @user = User.all
  end

  def organization
   
  end

  def about
  end

  def getmembership
    if user_signed_in? && current_user.student

      @membership = Membership.where(name: 'Student')

    elsif user_signed_in? 

      @membership = Membership.where(name: 'Regular')

    else
      @membership = Membership.where(name: 'Regular')
    end
  end

  def myprofile
  end

  def coreprinciples
  end

  def blog
  end

end
