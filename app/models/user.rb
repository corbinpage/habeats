class User < ActiveRecord::Base
  after_initialize :set_default_role, :if => :new_record?
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :jobs
  has_many :timers
  has_many :consents

  validates :name, :presence => true
  
  enum role: [:user, :proofreader, :admin]

  def set_default_role
    self.role ||= :user
  end
  
end