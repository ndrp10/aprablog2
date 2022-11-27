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

  def admin

    @members = User.all.order(premium_until: 'DESC').filter do |member|
      member.premium_until >= Time.now
     
    end

     if current_user.admin == 'false'
            redirect_to root_path
        else
            render 'admin'
        end
  end

end
