class User < ActiveRecord::Base
  has_many :goals
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def self.create_guest
    guest = User.new( name: "Anonymous",
                      email: Time.now.strftime("%Y%m%d%H%M%s")+"@test.com",
                      password: "password")
    guest.save!
    guest
  end

end