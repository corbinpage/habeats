FactoryGirl.define do
  factory :consent do
    user_id 1
procedure_id 1
indications_complete false
benefits_complete false
risks_complete false
alternatives_complete false
description_complete false
consent_complete false
  end

end
