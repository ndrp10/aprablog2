class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_create :set_premium, :set_admin
  after_create :send_welcome_email
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :orders
  

  EDUCATIONS = ["Bachelor of Science", "Master of Science", "PhD", "Post-doctorate or higher"]   

  private
  def set_premium
    self.premium_until = Date.yesterday if premium_until.nil? || (premium_until < Date.today)     
  end

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end

  

  def set_admin
    self.admin == 'false' if admin.nil?
  end

  

  def increment_premium
      self.premium_until = Date.now + 1.year
  end

  def signup_params
      params.require(:user).permit(:name, :student, :education, :field_of_study, :academic_interests, :expectations, :admin)
  end

  def self.find_by_uid!(uid)
    User.find_by!("name = :p OR id = :p", p: uid)
  end

end


  
 


