require 'rails_helper'

RSpec.describe "consents/show", :type => :view do
  before(:each) do
    @consent = assign(:consent, Consent.create!(
      :user_id => 1,
      :procedure_id => 2,
      :indications_complete => false,
      :benefits_complete => false,
      :risks_complete => false,
      :alternatives_complete => false,
      :description_complete => false,
      :consent_complete => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
