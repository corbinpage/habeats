class Goal < ActiveRecord::Base
  belongs_to :users
  has_many :days
  # attr_protected

end
