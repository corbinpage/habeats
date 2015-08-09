class User < ActiveRecord::Base
  after_initialize :set_default_role, :if => :new_record?
  has_many :goals
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def set_default_role
    self.role ||= :user
  end
  
  def self.create_guest
    guest = User.new( name: "Anonymous",
                      email: Time.now.strftime("%Y%m%d%H%M%s")+"@test.com",
                      password: "password")
    guest.save!
    guest
  end

end