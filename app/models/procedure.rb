class Procedure < ActiveRecord::Base
  has_one   :procedure_detail
  has_many :consents

end
